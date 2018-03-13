//
//  RegisterTextField.h
//  BanTangShop
//
//  Created by tzsoft on 2017/12/21.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterTextField : UITextField
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title placeholder:(NSString *)placeholder;
@property (nonatomic ,strong) UILabel *leftLab;
@end
