//
//  MainButton.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/12.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "MainButton.h"


@implementation MainButton
{
    NSString *_title;
    NSString *_iconName;
    NSString *_badge;
}
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title icon:(NSString *)iconName badge:(NSString *)badge{
    if (self = [super initWithFrame:frame]) {
        _title = title;
        _iconName = iconName;
        _badge = badge;
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapEvent)];
        [self addGestureRecognizer:tap];
        [self setupAllSubViews];
    }
    return self;
}

- (void)setupAllSubViews{
    UIImageView *iconView = [UIImageView new];
    [self addSubview:iconView];
    iconView.sd_layout
    .centerXEqualToView(self)
    .widthIs(45)
    .heightIs(45)
    .topSpaceToView(self, 10);
//    iconView.backgroundColor = [UIColor blueColor];
    iconView.image = [UIImage imageNamed:_iconName];
    iconView.userInteractionEnabled = YES;
    
    UILabel *titleLab = [UILabel new];
    [self addSubview:titleLab];
    titleLab.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(iconView, 0)
    .bottomSpaceToView(self, 0);
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:13];
    titleLab.textColor = Color_Text_Gray;
    titleLab.text = _title;
    titleLab.userInteractionEnabled = YES;
    
    // 添加未读消息数
    [iconView pp_moveBadgeWithX:-10 Y:0];
    if ([_badge isEqualToString:@"0"]) {
        [iconView pp_hiddenBadge];
    }else{
        [iconView pp_showBadge];
        [iconView pp_addBadgeWithText:_badge];
    }
    
}

#pragma mark - 点击手势
- (void)tapEvent{
    self.mainBtnClick(self.tag);
}
@end
