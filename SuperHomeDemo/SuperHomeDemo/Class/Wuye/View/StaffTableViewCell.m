//
//  StaffTableViewCell.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/17.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "StaffTableViewCell.h"

@implementation StaffTableViewCell
{
    UIImageView *imageView ;
    UILabel *nameLab;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = Color_Back_Gray;
        [self setupAllSubViews];
    }
    return self;
}
- (void)setupAllSubViews{
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    bgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 5)
    .bottomSpaceToView(self.contentView, 5);
    bgView.backgroundColor = [UIColor whiteColor];
    
    // 设置头像
    imageView = [UIImageView new];
    [bgView addSubview:imageView];
    imageView.sd_layout
    .leftSpaceToView(bgView, 10)
    .topSpaceToView(bgView, 10)
    .bottomSpaceToView(bgView, 10)
    .widthEqualToHeight();
    imageView.image = [UIImage imageNamed:@"headimg_placeholder"];
    imageView.sd_cornerRadiusFromHeightRatio = @(0.5);
    imageView.backgroundColor = [UIColor redColor];
    
    // 名字
    nameLab = [UILabel new];
    [bgView addSubview:nameLab];
    nameLab.sd_layout
    .leftSpaceToView(imageView, 5)
    .topSpaceToView(bgView, 0)
    .bottomSpaceToView(bgView, 0)
    .autoWidthRatio(0);
    nameLab.text = @"杜拉拉";
    [nameLab setSingleLineAutoResizeWithMaxWidth:80];
    
    //
    UILabel *lineLab = [UILabel new];
    [bgView addSubview:lineLab];
    lineLab.sd_layout
    .leftSpaceToView(nameLab, 13)
    .topSpaceToView(bgView, 28)
    .bottomSpaceToView(bgView, 28)
    .widthIs(2);
    lineLab.sd_cornerRadius = @(1);
    lineLab.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    
    // 职位
    UILabel *positionLab = [UILabel new];
    [bgView addSubview:positionLab];
    positionLab.sd_layout
    .leftSpaceToView(lineLab, 10)
    .topSpaceToView(bgView, 0)
    .bottomSpaceToView(bgView, 0)
    .rightSpaceToView(bgView, 25);
    positionLab.text = @"物业经理";
    positionLab.textColor = HXYGetColor(@"#4A90E2");
    
    //
    UIImageView *arrowImgView = [UIImageView new];
    [bgView addSubview:arrowImgView];
    arrowImgView.sd_layout
    .rightSpaceToView(bgView, 15)
    .centerYEqualToView(bgView)
    .widthIs(15)
    .heightIs(15);
    arrowImgView.image = [UIImage imageNamed:@"right_arrow_icon"];
    
}
@end
