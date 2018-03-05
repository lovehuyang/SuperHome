//
//  LanchViewController.h
//  HXYMyHome
//
//  Created by 胡小羊 on 17/3/21.
//  Copyright © 2017年 HXY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LanchModel.h"
@interface LanchViewManger : UIView

/** 广告模型*/
@property (nonatomic , strong) LanchModel  *adModel;

/**
 创建一个对象
 */
+ (instancetype)lanchViewController;

/**
 加载启动图
 */
- (void)showLanchViewToView:(UIView *)view;
@end
