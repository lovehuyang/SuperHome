//
//  NewsListCell.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "NewsListCell.h"

@implementation NewsListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupAllSubViews];
    }
    return self;
}

- (void)setupAllSubViews{
    
    UIImageView *imgView = [UIImageView new];
    [self.contentView addSubview:imgView];
    imgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .bottomSpaceToView(self.contentView, 10)
    .widthIs(115);
    imgView.image = [UIImage imageNamed:@"banner_placeholder"];
    
    UILabel *titleLab = [UILabel new];
    [self.contentView addSubview:titleLab];
    titleLab.sd_layout.leftSpaceToView(imgView, 15)
    .topEqualToView(imgView)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    titleLab.sd_layout.maxHeightIs(45);
    titleLab.text = @"哈哈哈阿萨德飞机熬时间佛我安吉尔我房间奥尔发金额非Jane方能完成问佛女王呢按安分安神佛那我放纳森";
    titleLab.font = [UIFont systemFontOfSize:15];
    
    UILabel *timeLab = [UILabel new];
    [self.contentView addSubview:timeLab];
    timeLab.sd_layout
    .leftEqualToView(titleLab)
    .bottomSpaceToView(self.contentView, 10)
    .heightIs(15);
    [timeLab setSingleLineAutoResizeWithMaxWidth:200];
    timeLab.text = @"2018-10-30";
//    timeLab.backgroundColor = [UIColor redColor];
    timeLab.font = [UIFont systemFontOfSize:12];
    timeLab.textColor = HXYGetColor(@"#666666");
    
    UILabel *commentLab = [UILabel new];
    [self.contentView addSubview:commentLab];
    commentLab.sd_layout
    .leftSpaceToView(timeLab, 15)
    .topEqualToView(timeLab)
    .bottomEqualToView(timeLab)
    .rightSpaceToView(self.contentView, 10);
    commentLab.textColor = timeLab.textColor;
    commentLab.font = timeLab.font;
    commentLab.text = [NSString stringWithFormat:@"%d评论",540];
}
@end
