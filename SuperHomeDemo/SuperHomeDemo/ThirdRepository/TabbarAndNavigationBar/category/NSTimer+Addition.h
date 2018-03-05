//
//  NSTimer+Addition.h
//  ECSDKDemo_OC
//
//  Created by mac on 16/9/23.
//  Copyright © 2016年 ronglian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
