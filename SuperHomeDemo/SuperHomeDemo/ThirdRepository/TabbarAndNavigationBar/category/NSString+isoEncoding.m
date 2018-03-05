//
//  NSString+isoEncoding.m
//  ECSDKDemo_OC
//
//  Created by mac on 17/3/11.
//  Copyright © 2017年 ronglian. All rights reserved.
//

#import "NSString+isoEncoding.h"

@implementation NSString (isoEncoding)

+ (NSString *)unicode2ISO88591:(NSString *)string {
    
    
    NSStringEncoding enc =      CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    
    
    return [NSString stringWithCString:[string UTF8String] encoding:enc];
    
}

@end
