//
//  customNaviController.m
//  HappyDoctorDoctor
//
//  Created by mac on 16/7/19.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import "customNaviController.h"
#import "WRNavigationBar.h"

@interface customNaviController ()

@end

@implementation customNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarAppearence];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


- (void)setNavBarAppearence
{
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:Color_Theme];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
}
@end

