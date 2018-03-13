//
//  InputTextField.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/13.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "InputTextField.h"

@implementation InputTextField


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
