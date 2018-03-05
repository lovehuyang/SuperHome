//
//  GlobalTools.h
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetupTools : NSObject
/**
 *  本地化用户登录手机号
 */
@property (nonatomic ,strong)NSString *user_Phone;

/**
 *  本地化用户登录密码
 */
@property (nonatomic ,strong)NSString *user_Pwd;

/**
 *@brief 获取DemoGlobalClass单例句柄
 */
+(SetupTools *)sharedInstance;

/**
 选择根控制器

 @return 返回相应控制器
 */
-(id)chooseRootViewController;

/**
 是不是在登录状态

 @return yes正在登录
 */
- (BOOL)isInLogIn;


/**
 保存密码

 @param pwdStr 密码
 */
- (void)setUser_Pwd:(NSString *)pwdStr;

/**
 保存登录账号

 @param phoneStr 账号
 */
- (void)setUser_Phone:(NSString *)phoneStr;
@end
