//
//  AppDelegate.h
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/5.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+(AppDelegate*)shareInstance;

//适配屏幕比例
@property float autoSizeScale;

@property (strong, nonatomic) UIWindow *window;



@end

