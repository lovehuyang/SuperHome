//
//  CustomNavView.m
//  BanTangShop
//
//  Created by tzsoft on 2017/12/21.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import "CustomNavView.h"

@implementation CustomNavView
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews:title];
    }
    return self;
}

- (void)setupSubViews:(NSString *)title{
    //导航栏
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    navView.backgroundColor = [UIColor whiteColor];
    [self addSubview:navView];
    
    // 返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, Hight_Status , 44, 44);
    [navView addSubview:backBtn];
    [backBtn setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //标题
    UILabel *titleLab = [UILabel new];
    titleLab.frame = CGRectMake(0, Hight_Tabbar + 30, self.frame.size.width, 30);
    [navView addSubview:titleLab];
    titleLab.text = title;
    titleLab.font = [UIFont boldSystemFontOfSize:21];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor blackColor];
}

- (void)backBtnClick{
    self.returnEvent();
}
@end
