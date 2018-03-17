//
//  WuYeInfoView.m
//  SuperHomeDemo
//
//  Created by tzsoft on 2018/3/14.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "WuYeInfoView.h"

@implementation WuYeInfoView
{
    NSString *_title;
    NSString *_promise;
    NSString *_phone;
}
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title promise:(NSString *)promise phone:(NSString *)phone{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = Color_Theme;
        _title = title;
        _promise = promise;
        _phone = phone;
        [self setupAllSubViews];
    }
    return self;
}
- (void)setupAllSubViews{
    UILabel *titleLab = [UILabel new];
    [self addSubview:titleLab];
    titleLab.sd_layout
    .leftSpaceToView(self, 12)
    .topSpaceToView(self, 14)
    .rightSpaceToView(self, 12)
    .heightIs(25 *Scale);
    titleLab.textColor = [UIColor whiteColor];
    titleLab.font = [UIFont systemFontOfSize:18];
    titleLab.text = _title;
    
    UIButton *phoneBtn = [UIButton new];
    [self addSubview:phoneBtn];
    phoneBtn.sd_layout
    .rightSpaceToView(self, 15)
    .topSpaceToView(self, 15)
    .widthIs(35 *Scale)
    .heightEqualToWidth();
    [phoneBtn setImage:[UIImage imageNamed:@"wuye_icon_phone"] forState:UIControlStateNormal];
    [phoneBtn addTarget:self action:@selector(phoneBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *promiseLab = [UILabel new];
    [self addSubview:promiseLab];
    promiseLab.sd_layout
    .leftEqualToView(titleLab)
    .topSpaceToView(titleLab, 5)
    .rightSpaceToView(phoneBtn, 5)
    .bottomSpaceToView(self, 10);
    promiseLab.numberOfLines = 0;
    
    promiseLab.text = _promise;
    promiseLab.textColor = [UIColor whiteColor];
    promiseLab.font = [UIFont systemFontOfSize:14];
}

- (void)phoneBtnClick{
    self.makePhone(_phone);
}
@end
