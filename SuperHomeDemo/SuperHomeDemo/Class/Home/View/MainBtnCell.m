//
//  MainBtnCell.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "MainBtnCell.h"
#import "MainButton.h"

@implementation MainBtnCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier ]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupAllSubViews];
    }
    return  self;
}
- (void)setupAllSubViews{
    //每行列数
    NSInteger rank = 4;
    CGFloat W = ScrW/rank ;
    CGFloat H = W;
    //每列间距
    CGFloat rankMargin = (ScrW - rank * W) / (rank - 1);
    //每行间距
    CGFloat rowMargin = 0;
    //Item索引 ->根据需求改变索引
    NSUInteger index = 8;
    
    NSArray *titleArr = @[@"社区大事件",@"收费通知",@"停车位",@"社区门店",@"爱宠社团",@"物品置换",@"消息处理",@"社区名片"];
    NSArray *iconNameArr = @[@"main_btn",@"main_btn",@"main_btn",@"main_btn",@"main_btn",@"main_btn",@"main_btn",@"main_btn"];
    NSArray *badgeNum = @[@"0",@"1",@"7",@"0",@"0",@"10",@"0",@"100"];
    for (int i = 0 ; i< index; i++) {
        //Item X轴
        CGFloat X = (i % rank) * (W + rankMargin);
        //Item Y轴
        NSUInteger Y = (i / rank) * (H +rowMargin);
        //Item top
        CGFloat top = 0;
        MainButton *mainBtn = [[MainButton alloc]initWithFrame:CGRectMake(X, Y+top, W, H) title:titleArr[i] icon:iconNameArr[i] badge:badgeNum[i]];
        mainBtn.tag = 10 + i;
        __weak __typeof (self)weakSelf = self;
        mainBtn.mainBtnClick = ^(NSInteger btnTag) {
            weakSelf.mainBtnClick(btnTag);
        };
        [self.contentView addSubview:mainBtn];
    }
}

@end
