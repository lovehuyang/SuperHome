//
//  GlobalTools.m
//  BanTangShop
//
//  Created by tzsoft on 2017/12/16.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import "GlobalTools.h"
#import "LoginViewController.h"

@implementation GlobalTools

/**
 保存信息到沙盒
 
 @param value 值
 @param key key
 */
+ (void)saveData:(NSString *)value key:(NSString *)key{
    [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
/**
 根据key获取沙盒的值
 
 @param key key
 @return value
 */
+ (NSString *)getData:(NSString *)key{
   return  [[NSUserDefaults standardUserDefaults]objectForKey:key];
}

/**
 清空信息
 
 @param key key
 */
+ (void)removeData:(NSString *)key{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}

/**
 获取用户的登录状态

 @return yes：已经登录
 */
+ (BOOL)userIsLogin{
    NSString *userID = [self getData:USER_ID];
    if (!userID || userID.length == 0) {

        return NO; // 未登录
    }else{
        return YES;
    }
}

#pragma mark - 弹出登录页面

/**
 弹出登录页面
 */
+ (void)presentLoginViewController{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    UIViewController *currentVC = [self getCurrentWindowVC];
    [currentVC presentViewController:lvc animated:YES completion:nil];
}
#pragma mark - 获取状态栏的高度

+ (CGFloat)getStatusHight{
    
    CGRect StatusRect = [[UIApplication sharedApplication]statusBarFrame];
    return StatusRect.size.height;
}

+ (CGFloat)getStatusAndNavHight{
    
   return  [self getStatusHight] + 44;
}


/**
 计算文字的的长度

 @param text 文字
 @param font 字体大小
 @param maxSize 最大尺寸
 @return 计算完的尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    
    if ([text isKindOfClass:[NSNull class]] ||text == nil) {
        return CGSizeMake(0, 0);
        
    }else{
        NSDictionary *attrs = @{NSFontAttributeName : font};
        return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }
}

/**
 验证手机号是否可用

 @param phone 手机号码
 @return yes可用
 */
+ (BOOL)isValidPhone:(NSString *)phone{
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    //   NSString * PHS = @"^(0[0-9]{2})\\d{8}$|^(0[0-9]{3}(\\d{7,8}))$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 获取当前屏幕显示的viewcontroller

 @return 当前屏幕的控制器
 */
+(UIViewController *)getCurrentWindowVC{
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
/**
 获取当前屏幕显示的viewcontroller
 
 @return 当前屏幕的控制器
 */
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}
@end
