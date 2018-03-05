//
//  UILabel+layoutWidth.h
//  YZcustomSearchController
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 李亚州. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LYZ)

/**
 *  获取label宽度
 */
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

/**
 *  获取label高度
 */
+ (CGFloat)getLabelHeightByWidth:(CGFloat)width Title:(NSString *)title font:(UIFont *)font;

- (CGSize)contentSize;

@end
