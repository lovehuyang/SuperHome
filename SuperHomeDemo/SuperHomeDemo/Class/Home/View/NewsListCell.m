//
//  NewsListCell.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "NewsListCell.h"

@implementation NewsListCell
{
    UIImageView *imgView;
    UILabel *titleLab;
    UILabel *timeLab;
    UILabel *commentLab;

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupAllSubViews];
    }
    return self;
}

- (void)setupAllSubViews{
    
    imgView = [UIImageView new];
    [self.contentView addSubview:imgView];
    imgView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .bottomSpaceToView(self.contentView, 10)
    .widthIs(115);
    
    titleLab = [UILabel new];
    [self.contentView addSubview:titleLab];
    titleLab.sd_layout.leftSpaceToView(imgView, 15)
    .topEqualToView(imgView)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    titleLab.sd_layout.maxHeightIs(45);
    titleLab.font = [UIFont systemFontOfSize:15];
    
    timeLab = [UILabel new];
    [self.contentView addSubview:timeLab];
    timeLab.sd_layout
    .leftEqualToView(titleLab)
    .bottomSpaceToView(self.contentView, 10)
    .heightIs(15);
    [timeLab setSingleLineAutoResizeWithMaxWidth:200];
    
//    timeLab.backgroundColor = [UIColor redColor];
    timeLab.font = [UIFont systemFontOfSize:12];
    timeLab.textColor = Color_Text_Gray;
    
    commentLab = [UILabel new];
    [self.contentView addSubview:commentLab];
    commentLab.sd_layout
    .leftSpaceToView(timeLab, 15)
    .topEqualToView(timeLab)
    .bottomEqualToView(timeLab)
    .rightSpaceToView(self.contentView, 10);
    commentLab.textColor = timeLab.textColor;
    commentLab.font = timeLab.font;
    
    
    [self setValue];
}

- (void)setValue{
    imgView.image = [UIImage imageNamed:@"banner_placeholder"];
    titleLab.text = @"我是标题我是标题我是标题我是标题我是";
    timeLab.text = @"2018-10-30";
    commentLab.text = [NSString stringWithFormat:@"%d评论",540];
}
@end
