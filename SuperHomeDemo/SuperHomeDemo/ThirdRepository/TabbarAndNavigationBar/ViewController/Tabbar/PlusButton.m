//
//  PlusButton.m
//  BanTangShop
//
//  Created by tzsoft on 2017/12/16.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import "PlusButton.h"

@implementation PlusButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView.backgroundColor = [UIColor redColor];
        self.titleLabel.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    drawArc();// 画圆弧
}

/**
 *  画圆弧
 */
void drawArc(){
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    /**
     *
     *  @param ctx          上下文
     *  @param x            圆心的横坐标
     *  @param y            圆心的纵坐标
     *  @param radius       半径
     *  @param startAngle   开始角度
     *  @param endAngle     结束角度
     *  @param clockwise    圆弧的伸展方向(1逆时针，0顺时针)
     *
     */
    CGContextAddArc(ctx, 30, 30, 30, -M_PI +M_PI/6.5 , -M_PI/6.5, 0);
    CGContextSetLineWidth(ctx, 1);// 线的宽度
    CGContextSetStrokeColorWithColor(ctx, HXYGetColor(@"#D0D0D9").CGColor);
    CGContextStrokePath(ctx);
}
@end
