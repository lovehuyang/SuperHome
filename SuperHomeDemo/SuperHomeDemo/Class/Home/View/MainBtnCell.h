//
//  MainBtnCell.h
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainBtnCell : UITableViewCell

@property (nonatomic ,strong) void(^mainBtnClick)(NSInteger btnTag);

@end
