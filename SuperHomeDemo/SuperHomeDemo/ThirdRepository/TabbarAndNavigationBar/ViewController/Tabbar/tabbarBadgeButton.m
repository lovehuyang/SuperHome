//
//  tabbarBadgeButton.m
//  HappyDoctorDoctor
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import "tabbarBadgeButton.h"

@implementation tabbarBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
//        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.layer.cornerRadius = 8.0f;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:11.0f];
        [self setBackgroundColor:[UIColor redColor]];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue && badgeValue.intValue>0)
    {
        self.hidden = NO;
        
        if(badgeValue.intValue>99)
        {
            badgeValue = @"99+";
        }
        // 设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        // 设置frame
        CGRect frame = self.frame;
        
        // 设置提醒数字的位置
        CGFloat badgeH = 16.0f;
        CGFloat badgeW = 16.0f + (badgeValue.length-1)*5.0f;
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    }
    else
    {
        self.hidden = YES;
    }
}

@end
