//
//  RegisterTextField2.m
//  BanTangShop
//
//  Created by tzsoft on 2017/12/22.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import "RegisterTextField2.h"

@implementation RegisterTextField2

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title placeholder:(NSString *)placeholder{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        self.placeholder = placeholder;
        self.font = [UIFont systemFontOfSize:14];
        self.textAlignment = NSTextAlignmentLeft;
        self.tintColor= [UIColor blackColor];
//        self.leftView = [self addLefttViewWithTitel:title];
        self.rightView = [self addRightView];
//        self.leftViewMode = UITextFieldViewModeAlways;
        self.rightViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return self;
}
#pragma mark - 左视图
-(UILabel *)addLefttViewWithTitel:(NSString *)title{
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0 , 0 , 55 , self.frame.size.height - 0.5)];
    titleLab.text = title;
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor blackColor];
    titleLab.font = [UIFont boldSystemFontOfSize:14];
    return  titleLab;
}
#pragma mark - 右视图
- (UIButton *)addRightView{
    CGFloat Btn_W = 90;
    CGFloat Btn_Margin_X = 3;
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, Btn_W, self.frame.size.height - 2 *Btn_Margin_X);
    [rightBtn setTitle:@"" forState:UIControlStateNormal];
    rightBtn.layer.masksToBounds = YES;
    [rightBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [rightBtn setTitleColor:Color_Text_Gray forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightBtn;
    return self.rightBtn;
}

#pragma mark - 点击获取验证码
- (void)rightBtnClick{
    
    self.getSecurityCode();
}

#pragma mark -  发送验证码的倒计时操作
- (void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.rightBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                
                self.rightBtn.enabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.rightBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                
                self.rightBtn.enabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
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
