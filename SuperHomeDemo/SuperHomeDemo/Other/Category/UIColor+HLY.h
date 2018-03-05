//
//  UIColor+HLY.h
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/5.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HLY)

/**
 *  把16位颜色值装换成RGB颜色值
 *
 *  @param stringToConvert 16位颜色值字符串
 *
 *  @return RGB颜色值
 */
+ (UIColor *)colorWithHexString:(NSString*)stringToConvert;
@end
