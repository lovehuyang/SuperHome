//
//  WuYeStaffInfoCell.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/21.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "WuYeStaffInfoCell.h"

@implementation WuYeStaffInfoCell
{
    NSString *_title;
    NSString *_content;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title content:(NSString *)content{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _title = title;
        _content = content;
        [self setupAllSubViews];
    }
    return self;
}
- (void)setupAllSubViews{
    UILabel *titleLab = [UILabel new];
    [self.contentView addSubview:titleLab];
    titleLab.sd_layout
    .leftSpaceToView(self.contentView, 20)
    .topSpaceToView(self.contentView, 25)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(20);
    titleLab.font = [UIFont boldSystemFontOfSize:15];
    titleLab.text = _title;
    
    UILabel *contentLab = [UILabel new];
    [self.contentView addSubview:contentLab];
    contentLab.sd_layout
    .leftEqualToView(titleLab)
    .topSpaceToView(titleLab, 12)
    .rightSpaceToView(self.contentView, 20)
    .autoHeightRatio(0);
    contentLab.numberOfLines = 0;
    contentLab.font = [UIFont systemFontOfSize:13];
    contentLab.text = _content;
    contentLab.textColor = HXYGetColor(@"#666666");

    [self setupAutoHeightWithBottomViewsArray:@[titleLab, contentLab] bottomMargin:0];
}
@end
