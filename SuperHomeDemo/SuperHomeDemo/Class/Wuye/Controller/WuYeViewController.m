//
//  WuYeViewController.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/5.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "WuYeViewController.h"
#import "WuYeStaffInfoController.h"
#import "WuYeInfoView.h"
#import <SDCycleScrollView.h>
#import <WRNavigationBar.h>
#import "SliderView.h"
#import "StaffTableViewCell.h"
#import <MAMapKit/MAMapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface WuYeViewController ()<UITableViewDelegate, UITableViewDataSource,MAMapViewDelegate,AMapLocationManagerDelegate,SDCycleScrollViewDelegate>
@property (nonatomic ,strong) SDCycleScrollView *cycleView;// 顶部轮播图
@property (nonatomic ,strong) SliderView *sliderView;
@property (nonatomic ,strong) UITextView *introduceTextView;//物业介绍
@property (nonatomic ,strong) UITableView *tableview;//职员列表
@property (nonatomic ,strong) UIView *mapBgView;//地图的容器
@property (nonatomic ,strong) MAMapView *mapView;// 地图
@property (nonatomic, strong) AMapLocationManager *locationManager;
@end

@implementation WuYeViewController

- (instancetype)init{
    if(self = [super init]){
        [self wr_setNavBarBarTintColor:[UIColor whiteColor]];
        [self wr_setNavBarTitleColor:[UIColor blackColor]];
        [self wr_setNavBarShadowImageHidden:NO];// 显示导航栏分割线
        [self wr_setStatusBarStyle:UIStatusBarStyleDefault];// 状态栏
        self.title = @"物业信息";
        UIButton *rightItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightItemBtn.frame = CGRectMake(0, 0, 32, 32);
        [rightItemBtn addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
        [rightItemBtn setImage:[UIImage imageNamed:@"wuye_icon_unlike"] forState:UIControlStateNormal];
        [rightItemBtn setImage:[UIImage imageNamed:@"wuye_icon_like"] forState:UIControlStateSelected];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightItemBtn];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self loadScrollViewData];// 加载轮播图数据
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 添加大头针 并执行大头针的代理方法 MAMapViewDelegate117.151158,36.67058
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(36.67058, 117.151158);
    pointAnnotation.title = @"办公地点";
    pointAnnotation.subtitle = @"济南市历下区花园庄东路16号数码港公寓";
    [_mapView addAnnotation:pointAnnotation];
}

- (void)createUI{
    [self.view addSubview:self.cycleView];
    // 物业信息
    WuYeInfoView *wuyeInfoView = [[WuYeInfoView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cycleView.frame), ScrW, 100 *Scale) title:@"诚信行物业" promise:@"用心服务，因您改变" phone:@"15665889999"];
    wuyeInfoView.makePhone = ^(NSString *phoneNum) {
        DLog(@"%@",phoneNum);
    };
    [self.view addSubview:wuyeInfoView];
    
    // 选项卡
    SliderView *sliderView = [[SliderView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(wuyeInfoView.frame), ScrW, 50 *Scale) titleArr:@[@"物业介绍",@"职员列表",@"办公位置"]];
    __weak __typeof (self)weakSelf = self;
    sliderView.sliderBtnClick = ^(UIButton *sliderBtn) {
        [weakSelf sliderTitleClick:sliderBtn];
    };
    self.sliderView = sliderView;
    [self.view addSubview:self.sliderView];
    
    // introduceTextView物业介绍
    UITextView *introduceTextView = [UITextView new];
    introduceTextView.frame = CGRectMake(15, CGRectGetMaxY(self.sliderView.frame) , ScrW - 30, ScrH - CGRectGetMaxY(self.sliderView.frame)   - Hight_Tabbar - Hight_TOP);
    introduceTextView.editable = NO;
    introduceTextView.font = [UIFont systemFontOfSize:13];
    self.introduceTextView = introduceTextView;
    self.introduceTextView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.introduceTextView];
    
    self.introduceTextView.text = @"山东宏泰物业发展有限公司始于1997年，注册资金1500万元，是山东泰航投资管理股份有限公司旗下一家专业化物业管理服务企业。为更好的服务客户，2004年公司与国际一流物业管理公司——美国仲量联行签署战略合作协议，成为仲量联行在山东省的唯一战略合作伙伴。2016年公司与中国民生投资股份有限公司达成战略合作。作为中民投旗下山东地区的第一家战略投资物业企业，专注于物业服务和城市管理业务，秉承“用心服务、因您而变”的服务理念，沿着中民投服务国家战略路线，致力于打造全国现代物业服务一流品牌。";
    // 职员列表
    [self.view addSubview:self.tableview];
    
    // 办公位置（添加地图）
    [self loadMapView];
}

#pragma mark - 懒加载
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, self.introduceTextView.origin.y, ScrW, CGRectGetHeight(self.introduceTextView.frame))style:UITableViewStylePlain];
        _tableview.backgroundColor = Color_Back_Gray;
        _tableview.hidden = YES;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (SDCycleScrollView *)cycleView{
    if (!_cycleView) {
        //2、创建图片轮播器
        _cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScrW, IMG_H) delegate:self placeholderImage:[UIImage imageNamed:@"banner_placeholder"]];
        _cycleView.showPageControl = YES;
        _cycleView.autoScrollTimeInterval = 5;
        _cycleView.backgroundColor = [UIColor lightGrayColor];
    }
    return _cycleView;
}
#pragma mark - 地图
- (void)loadMapView{
    
    self.mapBgView = [UIView new];
    self.mapBgView.frame =  CGRectMake(0, CGRectGetMaxY(self.sliderView.frame) , ScrW , ScrH - CGRectGetMaxY(self.sliderView.frame)   - Hight_Tabbar - Hight_TOP);
    self.mapBgView.hidden = YES;
    self.mapBgView.backgroundColor = [UIColor whiteColor];
        
    self.mapView = [[MAMapView alloc] initWithFrame:self.mapBgView.bounds];
    [self.mapView setDelegate:self];// 设置地图的代理
    [self.mapBgView addSubview:self.mapView];
    [self.view addSubview:self.mapBgView];

    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

#pragma mark  - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"staff_cell";
    StaffTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[StaffTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WuYeStaffInfoController *svc = [[WuYeStaffInfoController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
}

#pragma mark - 加载轮播图数据

- (void)loadScrollViewData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //3、加载网络图片
        self.cycleView.imageURLStringsGroup = @[@"http://cc.cocimg.com/api/uploads//20180319/1521438318989864.jpg",@"http://cc.cocimg.com/api/uploads//20180320/1521511742798237.gif",@"https://gss0.bdstatic.com/5bVWsj_p_tVS5dKfpU_Y_D3/res/r/image/2018-03-20/c169b3f1cc8bff18f62526f73692cc3b.jpg",@"https://static.kuaishebao.com/h5/wb-recruit/swiper/04.png"];
    });
}

#pragma mark - 导航栏点击事件
- (void)rightItemClick:(UIButton *)rightBtn{
    rightBtn.selected = !rightBtn.selected;
}

#pragma mark - 滑动标题栏点击事件
- (void)sliderTitleClick:(UIButton *)titleBtn{
    switch (titleBtn.tag) {
        case 10:
            self.introduceTextView.hidden = NO;
            self.tableview.hidden = YES;
            self.mapBgView.hidden = YES;
            break;
        case 11:
            self.introduceTextView.hidden = YES;
            self.tableview.hidden = NO;
            self.mapBgView.hidden = YES;
            break;
        case 12:
            self.introduceTextView.hidden = YES;
            self.tableview.hidden = YES;
            self.mapBgView.hidden = NO;
            break;
            
        default:
            break;
    }
    DLog(@"%@",titleBtn.titleLabel.text);
}

#pragma mark - MAMapViewDelegate 大头针的代理方法

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation{
    
    DLog(@"大头针的类别：%@",[annotation class]);
    
    // 修改大头针的样式
    if ([annotation isKindOfClass:[MAUserLocation class]]) {
        DLog(@"当前位置的大头针");
        return nil;
        
    }else if ([annotation isKindOfClass:[MAPointAnnotation class]]){
        DLog(@"标记位置的大头针");
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        
        if (annotationView == nil){
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"icon_location"];
        annotationView.canShowCallout = YES;
        annotationView.draggable = YES;
        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
    return nil;
}
@end
