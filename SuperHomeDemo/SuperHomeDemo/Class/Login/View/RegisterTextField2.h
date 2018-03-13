//
//  RegisterTextField2.h
//  BanTangShop
//
//  Created by tzsoft on 2017/12/22.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterTextField2 : UITextField
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title placeholder:(NSString *)placeholder;

@property (nonatomic ,strong)UIButton *rightBtn;// 右侧按钮
/**
 获取验证码
 */
@property (nonatomic ,strong) void(^getSecurityCode)(void);

/**
 倒计时
 */
- (void)openCountdown;
@end
