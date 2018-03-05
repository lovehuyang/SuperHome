//
//  LanchModel.h
//  HXYMyHome
//
//  Created by 胡小羊 on 17/3/21.
//  Copyright © 2017年 HXY. All rights reserved.
//  加载启动页的广告数据模型

#import <Foundation/Foundation.h>

@interface LanchModel : NSObject
//广告海报图片的地址
@property (nonatomic, strong)NSString *adImgUrl;
//广告详情的地址
@property (nonatomic, strong)NSString *adContentUrl;
@end
