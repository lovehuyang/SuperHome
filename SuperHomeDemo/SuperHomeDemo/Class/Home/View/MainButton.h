//
//  MainButton.h
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainButton : UIView


/**
 初始化功能按钮

 @param frame 尺寸
 @param title 标题
 @param iconName 图表名
 @param badge 未读消息数
 @return 按钮
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title icon:(NSString *)iconName badge:(NSString *)badge;

@property (nonatomic ,strong) void(^mainBtnClick)(NSInteger btnTag);

@end
