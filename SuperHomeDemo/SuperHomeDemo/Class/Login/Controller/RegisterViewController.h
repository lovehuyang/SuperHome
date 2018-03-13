//
//  RegisterViewController.h
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/13.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

typedef NS_ENUM(NSInteger , Page_Type){
    Page_Register = 0,// 注册页面
    Page_FindPassword = 1,// 找回密码
};
@property (nonatomic ,assign) Page_Type page_Type;// 页面类型
@end
