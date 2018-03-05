//
//  GlobalTools.m
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "SetupTools.h"
#import "systemTabbar.h"
#import "NewFeatureViewController.h"
#import "LoginViewController.h"

#define USER_PHONE @"user_phone"//用户登录的手机号
#define USER_PWD @"user_password"//用户登录的密码

static SetupTools *globalToos;

@implementation SetupTools
+ (SetupTools *)sharedInstance{
    
    if (!globalToos) {
        globalToos = [[SetupTools alloc]init];
    }
    return globalToos;
}
// 选择根控制器
-(id)chooseRootViewController{
    
    // 是不是已经登录
    BOOL isLogIn = [[SetupTools sharedInstance]isInLogIn];
    isLogIn = YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults stringForKey:@"versionCode"];
    //获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    if ([currentVersion isEqualToString:lastVersion]) {//已经使用过
        //显示状态栏
        [UIApplication sharedApplication].statusBarHidden = NO;
        
//        return isLogIn?[[systemTabbar alloc]init]:[[LoginViewController alloc]init];
        return [[systemTabbar alloc]init];// 直接进入页面
        
    }else{//未使用过
        [UIApplication sharedApplication].statusBarHidden = YES;
        NewFeatureViewController *nvc = [[NewFeatureViewController alloc]init];
        //存储当前版本信息
        [defaults setObject:currentVersion forKey:@"versionCode"];
        [defaults synchronize];
        
        return nvc;
    }
}
/**
 是不是在登录状态
 
 @return yes正在登录
 */
- (BOOL)isInLogIn{
    if ([self user_Pwd].length >0  && [self user_Phone].length > 0){
        return YES;
    }else{
        return NO;
    }
}

- (void)setUser_Pwd:(NSString *)pwdStr{
    [self saveDataToLocalWithKey:USER_PWD andValue:pwdStr];
}
- (void)setUser_Phone:(NSString *)phoneStr{
    [self saveDataToLocalWithKey:USER_PHONE andValue:phoneStr];
}
/**
 获取用户信息

 @return 用户信息
 */
- (NSString *)user_Pwd{
    return  [self obtainDataFromLocalWithKey:USER_PWD];
}

/**
 获取用户信息

 @return 用户信息
 */
- (NSString *)user_Phone{
    return [self obtainDataFromLocalWithKey:USER_PHONE];
}

/**
 沙盒本地化数据

 @param key 键
 @param value 值
 */
- (void)saveDataToLocalWithKey:(NSString *)key andValue:(NSString *)value{
    [[NSUserDefaults standardUserDefaults]setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}


/**
 读取本地数据

 @param key 键
 @return 值
 */
- (NSString *)obtainDataFromLocalWithKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];
}
@end
