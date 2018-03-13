//
//  RegisterViewController.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/13.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "RegisterViewController.h"
#import "CustomNavView.h"
#import "RegisterTextField.h"
#import "RegisterTextField2.h"

#define Hight_NAV 120
@interface RegisterViewController ()
{
    RegisterTextField *userPhone_TF;
    RegisterTextField2 *security_TF;
    UITextField *password_TF;
    BOOL isAgree;// 同意条款
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isAgree = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    [self createUI];
}

- (void)createUI{
    // 手机号
    userPhone_TF = [[RegisterTextField alloc]initWithFrame:CGRectMake(25, 150 , ScrW - 50, 30) title:@"+86" placeholder:@"请输入手机号"];
    userPhone_TF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:userPhone_TF];
    
    // 验证码
    security_TF = [[RegisterTextField2 alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(userPhone_TF.frame) + 15, ScrW - 50, 30) title:@"" placeholder:@"验证码"];
    security_TF.keyboardType = UIKeyboardTypeNumberPad;
    __weak __typeof (self)wealkSelf = self;
    security_TF.getSecurityCode = ^{
        DLog(@"");
        [wealkSelf getSecurityCode];
    };
    [self.view addSubview:security_TF];
    
    // 密码
    NSString *passwordPlaceholder = self.page_Type == Page_Register?@"新密码（6-16个字符）":@"密码（6-16个字符）";
    password_TF = [[RegisterTextField alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(security_TF.frame) + 15 , ScrW - 50, 30) title:@"" placeholder:passwordPlaceholder];
    password_TF.leftViewMode = UITextFieldViewModeNever;
    password_TF.keyboardType = UIKeyboardTypeASCIICapable;
    [self.view addSubview:password_TF];
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:selectBtn];
    selectBtn.sd_layout
    .leftSpaceToView(self.view, 25)
    .topSpaceToView(password_TF, 35)
    .widthIs(125)
    .heightIs(34);
    [selectBtn setImage:[UIImage imageNamed:@"check"] forState:UIControlStateSelected];
    [selectBtn setImage:[UIImage imageNamed:@"check_no"] forState:UIControlStateNormal];
    [selectBtn setTitle:@" 我已阅读并同意" forState:UIControlStateSelected];
    [selectBtn setTitle:@" 我已阅读并同意" forState:UIControlStateNormal];
    [selectBtn setTitleColor:Color_Text_Gray9 forState:UIControlStateNormal];
    selectBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    selectBtn.selected = YES;
    [selectBtn addTarget:self action:@selector(agreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *agreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:agreementBtn];
    agreementBtn.sd_layout
    .leftSpaceToView(selectBtn, 0)
    .heightRatioToView(selectBtn, 1)
    .centerYEqualToView(selectBtn)
    .widthIs(145);
    [agreementBtn setTitle:@"《超级家园服务条款》" forState:UIControlStateNormal];
    agreementBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [agreementBtn setTitleColor:HXYGetColor(@"#4A90E2") forState:UIControlStateNormal];
    [agreementBtn addTarget:self action:@selector(showAgreement) forControlEvents:UIControlEventTouchUpInside];
    if (self.page_Type != Page_Register) {
        selectBtn.hidden = YES;
        agreementBtn.hidden = YES;
    }
    
    // 登录按钮
    UIButton *registerBtn = [UIButton new];
    [self.view addSubview:registerBtn];
    registerBtn.sd_layout
    .topSpaceToView(agreementBtn, 24)
    .leftSpaceToView(self.view, 25)
    .rightSpaceToView(self.view, 25)
    .heightIs(45);
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"Rectangle"] forState:UIControlStateNormal];
    [registerBtn setTitle:self.page_Type == Page_Register ? @"注册":@"完成并登录" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 创建导航栏
- (void)createNavBar{
    CustomNavView *navBar = [[CustomNavView alloc]initWithFrame:CGRectMake(0, 0, ScrW, Hight_NAV) title:self.page_Type == Page_Register?@"手机号码注册":@"找回密码"];
    navBar.backgroundColor = [UIColor orangeColor];
    navBar.returnEvent = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [self.view addSubview:navBar];
}
#pragma mark - 获取验证码
- (void)getSecurityCode{
    [security_TF openCountdown];
}
#pragma mark - 点击同意条款
- (void)agreeBtnClick:(UIButton *)selectBtn
{
    selectBtn.selected = !selectBtn.selected;
    isAgree = selectBtn.selected;
}
#pragma mark - 显示条款
- (void)showAgreement{
    
}
#pragma mark - 注册
- (void)registerBtnClick{
    if (isAgree) {
        DLog(@"注册");
    }else{
        DLog(@"未同意条款");
    }
}
@end
