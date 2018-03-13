//
//  RegisterTextField.m
//  BanTangShop
//
//  Created by tzsoft on 2017/12/21.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import "RegisterTextField.h"

@implementation RegisterTextField

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title placeholder:(NSString *)placeholder{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        self.placeholder = placeholder;
        self.font = [UIFont systemFontOfSize:14];
        self.textAlignment = NSTextAlignmentLeft;
        self.tintColor= [UIColor blackColor];
        self.leftView = [self addLefttViewWithTitel:title];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return self;
}

-(UILabel *)addLefttViewWithTitel:(NSString *)title{

    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0 , 0 , 55 , self.frame.size.height - 0.5)];
    titleLab.text = title;
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor blackColor];
    titleLab.font = [UIFont systemFontOfSize:21];
    self.leftLab = titleLab;
    return  self.leftLab;
}
- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设定起点
    CGContextMoveToPoint(ctx, 0, self.frame.size.height - 0.3);
    //添加一条线段到坐标为（100，100）的点
    CGContextAddLineToPoint(ctx, self.frame.size.width , self.frame.size.height - 0.3);
    //设置线条的颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    CGContextSetLineWidth(ctx, 0.3);
    CGContextStrokePath(ctx);
    
    //3、渲染显示到view上面 (Stroke:空心的)
    CGContextStrokePath(ctx);
}
@end
