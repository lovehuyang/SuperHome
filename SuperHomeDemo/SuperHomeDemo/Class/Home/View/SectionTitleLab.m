//
//  SectionTitleLab.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "SectionTitleLab.h"

@implementation SectionTitleLab
{
    NSString *_title;
    UILabel *titleLab;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    if (self = [super initWithFrame:frame]) {
        _title = title;
        self.backgroundColor = [UIColor whiteColor];

        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    titleLab = [UILabel new];
    [self addSubview:titleLab];
    titleLab.sd_layout
    .leftSpaceToView(self, 10)
    .topSpaceToView(self, 0)
    .bottomSpaceToView(self, 0);
    titleLab.text = _title;
    [titleLab setSingleLineAutoResizeWithMaxWidth:200];
    titleLab.font = [UIFont boldSystemFontOfSize:15];
    titleLab.textAlignment = NSTextAlignmentCenter;
}
- (void)drawRect:(CGRect)rect{
    
    
    DLog(@"%f",self.frame.size.height);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设定起点
    CGContextMoveToPoint(ctx, 0, CGRectGetMaxY(titleLab.frame) - 2);
    //添加一条线段到坐标为（100，100）的点
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(titleLab.frame) + 10, CGRectGetMaxY(titleLab.frame) - 2);
    //设置线条的颜色
    CGContextSetStrokeColorWithColor(ctx, Color_Theme.CGColor);
    CGContextSetLineWidth(ctx, 2);
    CGContextStrokePath(ctx);
    
    //3、渲染显示到view上面 (Stroke:空心的)
    CGContextStrokePath(ctx);
    
    //4、画另一条线
    CGContextMoveToPoint(ctx, CGRectGetMaxX(titleLab.frame) + 10, CGRectGetMaxY(titleLab.frame) - 1);
    //继续添加线段
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(self.frame), CGRectGetMaxY(titleLab.frame) - 1);
    //设置线条的宽度
    CGContextSetLineWidth(ctx, 1);
    //设置线条的颜色
    CGContextSetStrokeColorWithColor(ctx, Color_Back_Gray.CGColor);
    
    CGContextStrokePath(ctx);
    
}
@end
