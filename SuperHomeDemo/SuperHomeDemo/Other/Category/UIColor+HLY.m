//
//  UIColor+HLY.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/5.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "UIColor+HLY.h"

@implementation UIColor (HLY)
/**
 *  把16位颜色值装换成RGB颜色值
 *
 *  @param stringToConvert 16位颜色值字符串
 *
 *  @return RGB颜色值
 */
+ (UIColor *)colorWithHexString:(NSString*)stringToConvert
{
    if([stringToConvert hasPrefix:@"#"])
    {
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    NSScanner*scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum])
    {
        return nil;
    }
    return [UIColor colorWithRGBHex:hexNum];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >>16) &0xFF;
    int g = (hex >>8) &0xFF;
    int b = (hex) &0xFF;
    return [UIColor colorWithRed:r /255.0f
                           green:g /255.0f
                            blue:b /255.0f
                           alpha:1.0f];
}
@end
