//
//  TabbarAndNavBarHeaderFile.h
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#ifndef TabbarAndNavBarHeaderFile_h
#define TabbarAndNavBarHeaderFile_h

#import "UIColor+HXY.h"
#import <SDAutoLayout.h>
#import "UIImageView+WebCache.h"
#import "customNaviController.h"
#import "systemTabbar.h"
#import "LanchViewManger.h"
#import "LanchModel.h"
#import "SetupTools.h"
#import <MBProgressHUD.h>
#import "MBProgressHUD+NHAdd.h"

#define ScrW [UIScreen mainScreen].bounds.size.width
#define ScrH [UIScreen mainScreen].bounds.size.height

/** 设置颜色16进制值 */
#define HXYGetColor(colorValue)   [UIColor colorWithHexString:colorValue]
/** 设置颜色RGB值 */
#define RGB(a,b,c) [UIColor colorWithRed:(a/255.0) green:(b/255.0) blue:(c/255.0) alpha:1.0]
/** 设置颜色RGB值+透明度 */
#define RGBA(a,b,c,d) [UIColor colorWithRed:(a/255.0) green:(b/255.0) blue:(c/255.0) alpha:d]

#define BGCOLOR [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f]

#endif /* TabbarAndNavBarHeaderFile_h */
