//
//  SliderView.h
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/14.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderView : UIView
- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr;

@property (nonatomic ,strong) void(^sliderBtnClick)(UIButton *sliderBtn);
@end
