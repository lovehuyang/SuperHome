//
//  LaunchView.h
//  HXYMyHome
//
//  Created by 胡小羊 on 17/3/24.
//  Copyright © 2017年 HXY. All rights reserved.
//

#import <UIKit/UIKit.h>

//跳过按钮宽
#define kSkipBtnWidth 65
//跳过按钮高
#define kSkipBtnHeight 30
//跳过按钮右边距
#define kSkipRightEdging 20
//跳过按钮顶部边距
#define kSkipTopEdging 40
//默认广告页面高度
#define kAdImageViewHeight ScrH-100
@interface LaunchView : UIView

@property (nonatomic, weak) UIImageView *launchImageView;

@property (nonatomic, weak) UIImageView *adImageView;

@property (nonatomic, weak) UIButton *skipBtn;
@end
