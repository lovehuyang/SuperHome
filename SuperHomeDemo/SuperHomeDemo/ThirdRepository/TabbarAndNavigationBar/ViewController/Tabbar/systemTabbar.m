//
//  systemTabbar.m
//  HappyDoctorDoctor
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import "systemTabbar.h"
#import "customNaviController.h"
#import "HomeViewController.h"
#import "FavoriteViewController.h"
#import "ProfileViewController.h"
#import "WuYeViewController.h"
#import "customTabbar.h"

#import "UIImage+LYZ.h"

@interface systemTabbar ()<customTabbarDelegate>

/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) customTabbar *customTabBar;
// 首页
@property (nonatomic, weak) HomeViewController *home;
// 收藏
@property (nonatomic, weak) FavoriteViewController *patientManager;
// 推荐
@property (nonatomic ,strong) WuYeViewController *wuye;
// 我
@property (nonatomic, weak) ProfileViewController *mine;

@end

@implementation systemTabbar

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCustomTabbar];
    [self setupAllChildViewControllers];
    
//    // 添加定时器，读取未读消息数
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(checkUnreadCount) userInfo:nil repeats:YES];
//    // 把定时器添加到子线程，防止阻塞主线程
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

/*
 *  未读消息数
 */
- (void)checkUnreadCount
{
//    NSInteger badgeValue = [[IMMsgDBAccess sharedInstance] getAllUnreadChatMessageCount];
//    self.patientManager.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",(long)badgeValue];
//    // app的角标
//    [UIApplication sharedApplication].applicationIconBadgeNumber = badgeValue;
//    // badgeValue大于0，说明有未读消息
//    self.home.msgCircleBtn.selected = badgeValue>0;
}

- (void)setupCustomTabbar
{
    customTabbar *customTabBar = [[customTabbar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    customTabBar.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(customTabbar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

- (void)setupAllChildViewControllers
{
    // 首页
    HomeViewController *homePageVC = [[HomeViewController alloc] init];
    [self setupChildViewController:homePageVC title:@"首页" normalImage:[UIImage imageNamed:@"nav_index_x"] selectImage:[UIImage imageNamed:@"nav_index"]];
    self.home = homePageVC;
    
    // 物业
    WuYeViewController *wuye = [[WuYeViewController alloc] init];
    [self setupChildViewController:wuye title:@"物业" normalImage:[UIImage imageNamed:@"nav_index_x"] selectImage:[UIImage imageNamed:@"nav_index"]];
    self.wuye = wuye;
    
    //
    FavoriteViewController *favoriteVC = [[FavoriteViewController alloc] init];
    [self setupChildViewController:favoriteVC title:@"收藏" normalImage:[UIImage imageNamed:@"nav_activity_x"] selectImage:[UIImage imageNamed:@"nav_activity"]];
    self.patientManager = favoriteVC;
    
    ProfileViewController *mineVC = [[ProfileViewController alloc] init];
    [self setupChildViewController:mineVC title:@"我的" normalImage:[UIImage imageNamed:@"nav_setup_x"] selectImage:[UIImage imageNamed:@"nav_setup"]];
    self.mine = mineVC;
}

- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title normalImage:(UIImage *)normalImage selectImage:(UIImage *)selectImage
{
    childVC.title = title;
    childVC.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.title = title;
    customNaviController *nav = [[customNaviController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    [self.customTabBar addTabBarButtonWithItem:childVC.tabBarItem];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
    
    // 删除系统的tabbar,添加上自定义的tabbar
    for(UIView *view in self.tabBar.subviews)
    {
        if([view isKindOfClass:[UIControl class]])
        {
            [view removeFromSuperview];
        }
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

/**
 *  多级push之后，poptorootviewcontroller需要先删除系统的tabbar(IOS8之后允许动态添加tabbar,IOS8之前可以不用加这一步)
 */
-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    for (UIView *child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            
            [child removeFromSuperview];
        }
    }
}

@end
