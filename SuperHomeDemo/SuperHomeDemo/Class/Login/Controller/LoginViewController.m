//
//  LoginViewController.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/5.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "CustomNavView.h"
#import "InputTextField.h"

#define Hight_NAV 120
@interface LoginViewController ()
{
    UITextField *userPhone_TF;
    UITextField *password_TF;
    CustomNavView *navBar;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];// 创建导航栏
    [self createTextField];// 创建文本框
    [self addSwipeGesture];// 添加手势
}

#pragma mark - 添加轻扫手势
- (void)addSwipeGesture{
    UISwipeGestureRecognizer * recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:recognizer];
}

- (void)createTextField{
    
    NSArray *placeholder = @[@"请输入手机号码/账号",@"请输入密码"];
    for(int i=0; i<2; i++){
        
        InputTextField *tf = [[InputTextField alloc]init];
        [self.view addSubview:tf];
        tf.font = [UIFont systemFontOfSize:14];
        tf.sd_layout
        .leftSpaceToView(self.view, 25)
        .rightSpaceToView(self.view, 25)
        .topSpaceToView(navBar, 60 + 45 *i)
        .heightIs(30);
        
        tf.placeholder = placeholder[i];
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        if(i == 0){
            userPhone_TF = tf;
            userPhone_TF.keyboardType = UIKeyboardTypeNumberPad;
        }else{
            password_TF = tf;
            password_TF.secureTextEntry = YES;
        }
        [self.view addSubview:tf];
    }

    // 登录按钮
    UIButton *loginBtn = [UIButton new];
    [self.view addSubview:loginBtn];
    loginBtn.sd_layout
    .topSpaceToView(password_TF, 50)
    .leftSpaceToView(self.view, 25)
    .rightSpaceToView(self.view, 25)
    .heightIs(45);
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Rectangle"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginEvent) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *registerBtn = [UIButton new];
    [self.view addSubview:registerBtn];
    registerBtn.sd_layout
    .topSpaceToView(loginBtn, 15)
    .leftEqualToView(loginBtn)
    .widthIs(60)
    .heightIs(30);
    [registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    registerBtn.tag = 10;
    [registerBtn setTitleColor:Color_Text_Gray forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *forgetBtn = [UIButton new];
    [self.view addSubview:forgetBtn];
    forgetBtn.sd_layout
    .topEqualToView(registerBtn)
    .rightEqualToView(loginBtn)
    .widthRatioToView(registerBtn, 1)
    .heightRatioToView(registerBtn, 1);
    [forgetBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    forgetBtn.tag = 11;
    [forgetBtn setTitleColor:Color_Text_Gray forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 创建导航栏
- (void)createNavBar{
    navBar = [[CustomNavView alloc]initWithFrame:CGRectMake(0, 0, ScrW, Hight_NAV) title:@"登录"];
    navBar.backgroundColor = [UIColor orangeColor];
    __weak __typeof (self)weakSelf = self;
    navBar.returnEvent = ^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    [self.view addSubview:navBar];
}

#pragma mark - 登录
- (void)loginEvent{
    
}
#pragma mark - 注册账号/忘记密码
- (void)registerBtnClick:(UIButton *)btn{
    RegisterViewController *rvc = [[RegisterViewController alloc]init];
    rvc.page_Type = btn.tag - 10;
    [self presentViewController:rvc animated:YES completion:nil];
    
}
#pragma mark - 手势事件
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)gesture{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
