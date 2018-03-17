//
//  WuYeInfoView.h
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/14.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WuYeInfoView : UIView
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title promise:(NSString *)promise phone:(NSString *)phone;

@property (nonatomic ,strong) void (^makePhone)(NSString *phoneNum);
@end
