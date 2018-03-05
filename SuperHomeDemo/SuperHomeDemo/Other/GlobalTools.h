//
//  GlobalTools.h
//  BanTangShop
//
//  Created by tzsoft on 2017/12/16.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalTools : NSObject


/**
 保存信息到沙盒

 @param value 值
 @param key key
 */
+ (void)saveData:(NSString *)value key:(NSString *)key;

/**
 根据key获取沙盒的值

 @param key key
 @return value
 */
+ (NSString *)getData:(NSString *)key;

/**
 清空信息

 @param key key
 */
+ (void)removeData:(NSString *)key;

/**
 获取用户的登录状态
 
 @return yes：已经登录
 */
+ (BOOL)userIsLogin;

/**
 获取状态栏的高度
 
 @return 高度
 */
+ (CGFloat)getStatusHight;

/**
 获取状态栏和导航栏的高度

 @return 高度
 */
+ (CGFloat)getStatusAndNavHight;

/**
 计算文字的的长度
 
 @param text 文字
 @param font 字体大小
 @param maxSize 最大尺寸
 @return 计算完的尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 验证手机号是否可用
 
 @param phone 手机号码
 @return yes可用
 */
+ (BOOL)isValidPhone:(NSString *)phone;

/**
 弹出登录页面
 */
+ (void)presentLoginViewController;
/**
 获取当前屏幕显示的viewcontroller
 
 @return 当前屏幕的控制器
 */
+(UIViewController *)getCurrentUIVC;
@end
