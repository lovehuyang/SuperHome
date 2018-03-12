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

#define IMG_H  150.0/375*ScrW // 顶部轮播图高度
@interface HomeViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) SDCycleScrollView *tableHeadView;// 顶部轮播图
@end

@implementation HomeViewController
- (instancetype)init{
    if (self = [super init]) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"saoyisao"] style:UIBarButtonItemStylePlain target:self action:@selector(saoyisaoEvent)];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self loadScrollViewData];// 加载轮播图数据
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        DLog(@"%f",Hight_TOP);
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScrW, ScrH - Hight_TOP - Hight_Tabbar) style:UITableViewStylePlain];
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
    }
    return _tableHeadView;
}

#pragma mark - 加载轮播图数据

- (void)loadScrollViewData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //3、加载网络图片
        self.tableHeadView.imageURLStringsGroup = @[@"https://www.doc-sign.com/skin/images/5892845.png",@"https://www.doc-sign.com/skin/images/23130375.jpg",@"https://www.doc-sign.com/skin/images/1742141.jpg",@"https://www.doc-sign.com/skin/images/5892845.png",@"https://www.doc-sign.com/skin/images/23130375.jpg",@"https://www.doc-sign.com/skin/images/1742141.jpg"];
    });
}
#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
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
