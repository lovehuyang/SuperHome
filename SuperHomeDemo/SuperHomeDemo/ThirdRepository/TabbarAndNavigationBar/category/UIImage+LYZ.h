//
//  UIImage+LYZ.h
//  HappyDoctorDoctor
//
//  Created by mac on 16/7/1.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LYZ)

/**
 *  将颜色转化成图片
 *
 *  @param color 颜色值
 *
 */
+ (UIImage *)createImageWithColor:(UIColor*)color;

/**
 *  为图片添加毛玻璃效果
 *
 *  @param image 图片
 *  @param blur  透明度
 *
 */
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

/**
 *  将图片转化成圆形图0片
 */
- (UIImage *)circleImage;


/**
 压缩图片
 
 @param sourceImage 原始图片
 @return
 */
+ (NSData *)zipImage:(UIImage *)sourceImage;

@end
