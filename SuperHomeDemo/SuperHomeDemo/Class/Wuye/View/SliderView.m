//
//  SliderView.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/14.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "SliderView.h"

@implementation SliderView
{
    NSArray *_titleArr;
    UILabel *lineLab;
}
- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr{
    if (self = [super initWithFrame:frame]) {
        _titleArr = titleArr;
        self.backgroundColor = [UIColor whiteColor];
        [self setupAllSubViews];
    }
    return self;
}

- (void)setupAllSubViews{
    CGFloat cellW = ScrW/_titleArr.count;
    for (int i = 0; i < _titleArr.count; i ++) {
        UIButton *titleBtn = [UIButton new];
        [self addSubview:titleBtn];
        titleBtn.sd_layout
        .topSpaceToView(self, 0)
        .bottomSpaceToView(self, 3)
        .leftSpaceToView(self, cellW * i)
        .widthIs(cellW);
        titleBtn.tag = 10 + i;
        [titleBtn setTitle:_titleArr[i] forState:UIControlStateNormal];
        if (i == 0) {
            titleBtn.selected = YES;
        }
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self setBtnStatus];
    
    lineLab = [UILabel new];
    [self addSubview:lineLab];
    lineLab.sd_layout
    .leftSpaceToView(self, 0)
    .bottomSpaceToView(self, 0)
    .heightIs(3)
    .widthIs(cellW);
    lineLab.sd_cornerRadius = @(1.5);
    lineLab.backgroundColor = HXYGetColor(@"#4A90E2");
}

- (void)setBtnStatus{
    
    for (int i = 0; i < _titleArr.count; i ++) {
        UIButton *btn = (UIButton *)[self viewWithTag:10 + i];
        if (btn.selected == YES) {
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
            [btn setTitleColor:HXYGetColor(@"#333333") forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:HXYGetColor(@"#4A4A4A") forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
        }
    }
}

- (void)titleBtnClick:(UIButton *)titleBtn{
    for (int i = 0; i < _titleArr.count; i ++) {
        UIButton *btn = (UIButton *)[self viewWithTag:10 + i];
        if (btn.tag == titleBtn.tag) {
            btn.selected = YES;
            
        }else{
            btn.selected = NO;
        }
    }
    
    [UIView animateWithDuration:.2 animations:^{
        CGFloat cellW = ScrW/_titleArr.count;
        lineLab.sd_layout
        .leftSpaceToView(self, (titleBtn.tag - 10) * cellW);
        [lineLab updateLayout];
    }];
    
    [self setBtnStatus];
    
    self.sliderBtnClick(titleBtn);
}

- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设定起点
    CGContextMoveToPoint(ctx, 0, self.frame.size.height - 0.4);
    //添加一条线段到坐标为（100，100）的点
    CGContextAddLineToPoint(ctx, self.frame.size.width , self.frame.size.height - 0.4);
    //设置线条的颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    CGContextSetLineWidth(ctx, 0.4);
    CGContextStrokePath(ctx);
    
    //3、渲染显示到view上面 (Stroke:空心的)
    CGContextStrokePath(ctx);
}
@end
