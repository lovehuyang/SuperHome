//
//  WuYeStaffHeaderView.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/21.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "WuYeStaffHeaderView.h"

@implementation WuYeStaffHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgView = [UIImageView new];
        [self addSubview:bgView];
        bgView.sd_layout
        .leftSpaceToView(self, 0)
        .topSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .bottomSpaceToView(self, 0);
        bgView.image = [UIImage imageNamed:@"header_bgImg"];
        
        
        [self setupAllSubViews];
    }
    return  self;
}

- (void)setupAllSubViews{
    UIImageView *headImgView = [UIImageView new];
    [self addSubview:headImgView];
    headImgView.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self, 75)
    .widthIs(70 *Scale)
    .heightEqualToWidth();
    headImgView.layer.borderWidth = 1;
    headImgView.layer.borderColor = [UIColor whiteColor].CGColor;
    headImgView.sd_cornerRadius = @(70 *Scale * 0.5);
    headImgView.image = [UIImage imageNamed:@"main_btn"];
    
    UILabel *nameWithPositionLab = [UILabel new];
    [self addSubview:nameWithPositionLab];
    nameWithPositionLab.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(headImgView, 27)
    .heightIs(21);
    nameWithPositionLab.textAlignment = NSTextAlignmentCenter;
    nameWithPositionLab.font = [UIFont boldSystemFontOfSize:15];
    nameWithPositionLab.textColor = [UIColor whiteColor];
    nameWithPositionLab.text = @"杜拉拉·物业经理";
    
    UILabel *infoLab = [UILabel new];
    [self addSubview:infoLab];
    infoLab.sd_layout
    .leftEqualToView(nameWithPositionLab)
    .rightEqualToView(nameWithPositionLab)
    .topSpaceToView(nameWithPositionLab, 5)
    .heightRatioToView(nameWithPositionLab, 1);
    infoLab.font = [UIFont systemFontOfSize:14];
    infoLab.textColor = [UIColor whiteColor];
    infoLab.textAlignment = NSTextAlignmentCenter;
    infoLab.text = @"服务年龄 6年 | 性别 女 | 年龄 28岁";
    
    UILabel *purposeLab = [UILabel new];
    [self addSubview:purposeLab];
    purposeLab.sd_layout
    .leftEqualToView(nameWithPositionLab)
    .rightEqualToView(nameWithPositionLab)
    .topSpaceToView(infoLab, 5)
    .heightIs(35);
    purposeLab.numberOfLines = 0;
    purposeLab.font = [UIFont systemFontOfSize:13];
    purposeLab.textColor = [UIColor whiteColor];
    purposeLab.textAlignment = NSTextAlignmentCenter;
    purposeLab.text = @"以周到的服务，赢得广大客户的信任和厚爱。";
}
@end
