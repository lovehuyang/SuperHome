//
//  NSString+isoEncoding.h
//  ECSDKDemo_OC
//
//  Created by mac on 17/3/11.
//  Copyright © 2017年 ronglian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (isoEncoding)

/**
 转码
 */
+ (NSString *)unicode2ISO88591:(NSString *)string;

@end
