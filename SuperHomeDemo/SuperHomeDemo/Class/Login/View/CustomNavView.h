//
//  CustomNavView.h
//  BanTangShop
//
//  Created by tzsoft on 2017/12/21.
//  Copyright © 2017年 HLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavView : UIView
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;

@property (nonatomic ,strong) void(^returnEvent)(void);
@end
