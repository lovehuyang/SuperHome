//
//  WuYeStaffInfoController.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/20.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "WuYeStaffInfoController.h"
#import "WRNavigationBar.h"
#import "WuYeStaffInfoCell.h"
#import "WuYeStaffHeaderView.h"

#define NAVBAR_COLORCHANGE_POINT -80
#define IMAGE_HEIGHT 300 *Scale
#define SCROLL_DOWN_LIMIT 100
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

@interface WuYeStaffInfoController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) WuYeStaffHeaderView *headerView;
@end

@implementation WuYeStaffInfoController
- (instancetype)init{
    if (self = [super init]) {
        UIButton *itemBtn = [UIButton new];
        itemBtn.frame =CGRectMake(0, 0, 110, 44);
        [itemBtn setImage:[UIImage imageNamed:@"wo_erweima"] forState:UIControlStateNormal];
        [itemBtn setTitle:@" 服务二维码" forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT- Hight_TOP, 0, 0, 0);
    [self.tableView addSubview:self.headerView];
    [self.view addSubview:self.tableView];
    [self wr_setNavBarBackgroundAlpha:0];
    
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, ScrW, ScrH);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (WuYeStaffHeaderView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[WuYeStaffHeaderView alloc] initWithFrame:CGRectMake(0, -IMAGE_HEIGHT, ScrW, IMAGE_HEIGHT)];
//        _imgView.image = [self imageWithImageSimple:[UIImage imageNamed:@"header_bgImg"] scaledToSize:CGSizeMake(ScrW, IMAGE_HEIGHT+SCROLL_DOWN_LIMIT)];
    }
    return _headerView;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        WuYeStaffInfoCell *cell = [[WuYeStaffInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil title:@"自我介绍" content:@"姑娘貌美一枝花，才学素养人品佳。活泼开朗不八卦，头脑敏锐有想法。踏实奋进不做假，乐于求知肯深挖。"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else{
        
        WuYeStaffInfoCell *cell = [[WuYeStaffInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil title:@"服务内容" content:@"共用部位的维修、养护与管理；房屋共用设施设备的维修、养护与管理；物业管理区域内共用设施设备的维修、养护与管理；物业管理区域内的环境卫生与绿化管理服务；物业区域内公共秩序、消防、交通等协管事项服务；物业装饰装修管理服务；物业档案资料的管理；专项维修资金的代管服务。"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:ScrW tableView:self.tableView];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    DLog(@"offsetY:%f",offsetY);
    
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        [self changeNavBarAnimateWithIsClear:NO];
    }
    else
    {
        [self changeNavBarAnimateWithIsClear:YES];
    }
    
    //限制下拉的距离
    if(offsetY < LIMIT_OFFSET_Y) {
        [scrollView setContentOffset:CGPointMake(0, LIMIT_OFFSET_Y)];
    }
    
    // 改变图片框的大小 (上滑的时候不改变)
    // 这里不能使用offsetY，因为当（offsetY < LIMIT_OFFSET_Y）的时候，y = LIMIT_OFFSET_Y 不等于 offsetY
    CGFloat newOffsetY = scrollView.contentOffset.y;
    if (newOffsetY < -IMAGE_HEIGHT)
    {
        self.headerView.frame = CGRectMake(0, newOffsetY, ScrW, -newOffsetY);
    }
}

- (void)changeNavBarAnimateWithIsClear:(BOOL)isClear
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.6 animations:^
     {
         __strong typeof(self) pThis = weakSelf;
         if (isClear == YES) {
             [pThis wr_setNavBarBackgroundAlpha:0];
         } else {
             [pThis wr_setNavBarBackgroundAlpha:1.0];
         }
     }];
}
- (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width*2, newSize.height*2));
    [image drawInRect:CGRectMake (0, 0, newSize.width*2, newSize.height*2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
