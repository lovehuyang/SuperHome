//
//  RootViewController.m
//  HappyDoctorDoctor
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        self.edgesForExtendedLayout =  UIRectEdgeNone;
    }
}

///**
// *  菊花过渡动画
// *
// *  @param str  过渡动画的文字
// *  @param view 显示位置
// */
//- (void)upLoadPersonalInfoWith:(NSString *)str
//{
//    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//   hud.detailsLabel.text = str;
//    hud.removeFromSuperViewOnHide = YES;
//}
//
///**
// *  黑底提示信息
// *
// *  @param message 显示的提示信息
// *  @param view    显示位置
// */
//- (void)toast:(NSString*)message
//{
//    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeText;
//    hud.userInteractionEnabled = NO;//防止阻塞用户交互
//    hud.detailsLabel.text = message;
//    [hud hideAnimated:YES afterDelay:2];
//}
//
//
//- (void)showCustomProgressWithTitle:(NSString *)title andImage:(NSString *)imgName{
//
//    if (imgName == nil) {
//        imgName = @"Checkmark";
//    }
//    [MBProgressHUD showCustomView:[[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
//                           toView:self.view
//                            title:title];
//
//}
//
///**
// *  隐藏指示器
// */
//- (void)hidenMBProgressHUD{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end
