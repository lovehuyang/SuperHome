//
//  customTabbar.h
//  HappyDoctorDoctor
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@class customTabbar;

@protocol customTabbarDelegate <NSObject>

@optional

- (void)tabBar:(customTabbar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface customTabbar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<customTabbarDelegate> delegate;

@end
