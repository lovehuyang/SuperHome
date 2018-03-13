//
//  RootViewController.h
//  HappyDoctorDoctor
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

/**
 *  菊花过渡动画
 *
 *  @param str  过渡动画的文字
 *  @param view 显示位置
 */
- (void)upLoadPersonalInfoWith:(NSString *)str;
/**
 *  黑底提示信息
 *
 *  @param message 显示的提示信息
 *  @param view    显示位置
 */
- (void)toast:(NSString*)message;

/**
 自定义提示

 @param title 提示信息
 @param imgName 自定义图片
 */
- (void)showCustomProgressWithTitle:(NSString *)title andImage:(NSString *)imgName;

/**
 *  隐藏指示器
 */
- (void)hidenMBProgressHUD;

/**
 弹出登录页面
 */
- (void)presentLoginViewController;

@end
