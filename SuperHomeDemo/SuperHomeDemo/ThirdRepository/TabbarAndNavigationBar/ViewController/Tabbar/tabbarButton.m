//
//  tabbarButton.m
//  HappyDoctorDoctor
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import "tabbarButton.h"
#import "tabbarBadgeButton.h"
#import "UIImage+LYZ.h"

const CGFloat tabbarBtnScale = 0.4;   /** 底边栏按钮中图片和标题的比例 */

@interface tabbarButton()
/**
 *  提醒数字
 */
@property (nonatomic, weak) tabbarBadgeButton *badgeButton;

@end

@implementation tabbarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11.0f];
        // 设置按钮的颜色
        [self setTitleColor:HXYGetColor(@"#777777") forState:UIControlStateNormal];
        [self setTitleColor:Color_Theme forState:UIControlStateSelected];
        // 图标居中
        self.imageView.contentMode = UIViewContentModeBottom;
        // 添加一个提醒数字按钮
        tabbarBadgeButton *badgeButton = [[tabbarBadgeButton alloc] init];
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }
    return self;
}

/**
 *  重写去掉高亮状态
 */
- (void)setHighlighted:(BOOL)highlighted {}

/**
 *  内部图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(0, 0, imageW, imageH*(1-tabbarBtnScale));
}

/**
 *  内部图片的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(0, imageH*(1-tabbarBtnScale), imageW, imageH*tabbarBtnScale);
}

/**
 *  设置item,接受数据
 */
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // KVO 监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"title"];
}

/**
 *  监听到某个对象的属性改变了,就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    
    // 设置选中图片
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    // 设置标题
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;

    // 设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = ScrW/6+10.0f;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}

@end
