//
//  HomeViewController.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/5.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "HomeViewController.h"
#import <SDCycleScrollView.h>
#import <MMScan/MMScanViewController.h>
#import "UIScrollView+JElasticPullToRefresh.h"// 下拉刷新
#import "SectionTitleLab.h"
#import "NewsListCell.h"
#import "MainBtnCell.h"
#import "AutoScrollLabel.h" // 跑马灯

#define IMG_H  150.0/375*ScrW // 顶部轮播图高度
@interface HomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)AutoScrollLabel *communityName;
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) SDCycleScrollView *tableHeadView;// 顶部轮播图
@property (nonatomic ,strong) UIView *mainBtnView;// 主功能按钮的容器
@end

@implementation HomeViewController
- (instancetype)init{
    if (self = [super init]) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"saoyisao"] style:UIBarButtonItemStylePlain target:self action:@selector(saoyisaoEvent)];
        self.communityName = [[AutoScrollLabel alloc]init];
        self.communityName.text = @"hahahh hahahhhahahhhahahhhahahhhahahhhahahh";
        self.communityName.frame = CGRectMake(0, 0, 200, 44);
        self.communityName.backgroundColor = [UIColor redColor];
        
        UILabel *tempLab = [UILabel new];
        tempLab.frame = CGRectMake(0, 0, 100, 44);
        tempLab.text = @"我是首页";
        self.navigationItem.titleView.backgroundColor = [UIColor yellowColor];
//        self.navigationItem.titleView = tempLab;
//        [tempLab addSubview:self.communityName];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self addRefreashAnimation];// 添加下拉刷新
    [self loadScrollViewData];// 加载轮播图数据
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        DLog(@"%f",Hight_TOP);
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScrW, ScrH - Hight_TOP - Hight_Tabbar) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tableHeadView;
    }
    return _tableView;
}

- (SDCycleScrollView *)tableHeadView{
    if (!_tableHeadView) {
        //2、创建图片轮播器
        _tableHeadView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScrW, IMG_H) delegate:self placeholderImage:[UIImage imageNamed:@"banner_placeholder"]];
        _tableHeadView.showPageControl = YES;
        _tableHeadView.autoScrollTimeInterval = 5;
        _tableHeadView.backgroundColor = [UIColor lightGrayColor];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableHeadView;
}
#pragma mark - 下拉刷新
- (void)addRefreashAnimation{
    JElasticPullToRefreshLoadingViewCircle *loadingViewCircle = [[JElasticPullToRefreshLoadingViewCircle alloc] init];
    loadingViewCircle.tintColor = [UIColor whiteColor];
    __weak __typeof(self)weakSelf = self;
    [self.tableView addJElasticPullToRefreshViewWithActionHandler:^{
        
        [weakSelf.tableView stopLoading];
        
    } LoadingView:loadingViewCircle];
    [self.tableView setJElasticPullToRefreshFillColor:Color_Theme];
    [self.tableView setJElasticPullToRefreshBackgroundColor:self.tableView.backgroundColor];
}
#pragma mark - 加载轮播图数据

- (void)loadScrollViewData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //3、加载网络图片
        self.tableHeadView.imageURLStringsGroup = @[@"https://www.doc-sign.com/skin/images/5892845.png",@"https://www.doc-sign.com/skin/images/23130375.jpg",@"https://www.doc-sign.com/skin/images/1742141.jpg",@"https://www.doc-sign.com/skin/images/5892845.png",@"https://www.doc-sign.com/skin/images/23130375.jpg",@"https://www.doc-sign.com/skin/images/1742141.jpg"];
    });
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        static NSString *homeCell = @"home_News_cell";
        NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCell];
        if (!cell) {
            cell = [[NewsListCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:homeCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    static NSString *homeCell = @"home_cell";
    MainBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCell];
    if (!cell) {
        cell = [[MainBtnCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:homeCell];
    }
    cell.mainBtnClick = ^(NSInteger btnTag) {
        DLog(@"功能主键：%ld",(long)btnTag);
    };
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    UIView *view = [UIView new];
    view.backgroundColor = Color_Back_Gray;
    view.frame = CGRectMake(0, 0, ScrW, 40);
    SectionTitleLab *lab = [[SectionTitleLab alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, 30) title:@"推荐新闻"];
    [view addSubview:lab];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 100;
    }
    return ScrW/4 * 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 5;
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    DLog(@"点击了 - %ld",(long)index);
}

#pragma mark - 扫一扫
- (void)saoyisaoEvent{
    MMScanViewController *scanVc = [[MMScanViewController alloc] initWithQrType:MMScanTypeQrCode onFinish:^(NSString *result, NSError *error) {
        if (error) {
            NSLog(@"error: %@",error);
        } else {
            NSLog(@"扫描结果：%@",result);
            
        }
    }];
    [self.navigationController pushViewController:scanVc animated:YES];
}
@end
