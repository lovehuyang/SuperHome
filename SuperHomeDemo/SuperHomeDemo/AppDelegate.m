//
//  AppDelegate.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/5.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "AppDelegate.h"
#import "SetupTools.h"
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self fitScale];
    [self regiterMap];// 初始化地图
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[SetupTools sharedInstance]chooseRootViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - 屏幕比例
- (void)fitScale{
    
    AppDelegate *myDelegate = [AppDelegate shareInstance]; ;
    
    if(ScrH > 480){ // 这里以(iPhone4S)为准
        myDelegate.autoSizeScale = ScrW/375;
    }else{
        myDelegate.autoSizeScale = 1.0;
    }
}

#pragma mark - 配置高德地图key
- (void)regiterMap{
    [AMapServices sharedServices].apiKey = MAP_KEY;
    [AMapServices sharedServices].enableHTTPS = YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_AUTOSCROLLLAB object:nil];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

+ (AppDelegate *)shareInstance
{
    return [[UIApplication sharedApplication] delegate];
}
@end
