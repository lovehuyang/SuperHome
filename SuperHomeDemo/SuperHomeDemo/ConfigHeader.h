//
//  ConfigHeader.h
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/5.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#ifndef ConfigHeader_h
#define ConfigHeader_h

// 常用的键值
#define USER_ID @"user_id"// 用户ID
#define USER_PHONE @"user_phone"// 用户登录手机号
#define USER_PASSWORD @"user_password" // 用户密码

//常用颜色
#define Color_Theme HXYGetColor(@"#3F60C1")// 主题色
#define Color_Back_Gray HXYGetColor(@"#F6F6F6")// 背景灰色
#define Color_Text_Gray HXYGetColor(@"#666666")// 字体灰色

// 常用值
#define Hight_TOP [GlobalTools getStatusAndNavHight]
#define Hight_Status [GlobalTools getStatusHight]//状态栏 + 导航栏高度
#define Hight_Tabbar [GlobalTools getTabbarHight]// tabbar的高度

// 通知
#define NOTIFICATION_AUTOSCROLLLAB @"Notification_AutoScrollLable"// APP从前台进入到后台，跑马灯轮播
#endif /* ConfigHeader_h */
