//
//  customTabbar.m
//  HappyDoctorDoctor
//
//  Created by mac on 16/7/18.
//  Copyright © 2016年 胡小羊. All rights reserved.
//

#import "customTabbar.h"
#import "tabbarButton.h"
#import "PlusButton.h"
#import "HouseViewController.h"

@interface customTabbar()
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) tabbarButton *selectedButton;
@property (nonatomic,weak)PlusButton *plusButton;
@end
@implementation customTabbar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        //添加一个“+”按钮
        PlusButton *plusButton = [PlusButton buttonWithType:UIButtonTypeCustom];
        [plusButton setImage:[UIImage imageNamed:@"activity_ing"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"activity_ing"] forState:UIControlStateHighlighted];
        [self addSubview:plusButton];
        [plusButton setBackgroundColor:[UIColor whiteColor]];
        plusButton.bounds = CGRectMake(0, 0, 60, 60);
        plusButton.layer.cornerRadius = 30;
        plusButton.layer.masksToBounds = YES;
        self.plusButton = plusButton;
        [self.plusButton addTarget:self action:@selector(plusButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self drawCircle];

    }
    return self;
}
- (void)drawCircle{
    //设置路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //第一个参数是起点，是圆形的圆心
    //第二个参数是半径
    //第三个参数是起始弧度
    //第四个参数是结束弧度
    //第五个参数是传入yes是顺时针,no为顺时针，下面的另外一种实现方法的参数意思也是一致
    [path addArcWithCenter:CGPointMake(self.plusButton.center.x,self.plusButton.center.y) radius:10 startAngle:0 endAngle:M_PI_2 clockwise:NO];
    //渲染
    [path stroke];
}
-(void)plusButtonClick{
    DLog(@"我点击了加号按钮");
    UIViewController *tempVC = [GlobalTools getCurrentUIVC];
    HouseViewController *cvc = [[HouseViewController alloc]init];
    [tempVC.navigationController pushViewController:cvc animated:YES];

}

/**
 *  对按钮进行赋值
 *
 *  @param item 数据模型
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1.创建按钮
    tabbarButton *button = [[tabbarButton alloc] init];
    [self addSubview:button];
    // 添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    // 2.设置数据
    button.item = item;
    
    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.tabBarButtons.count == 1)
    {
        [self buttonClick:button];
    }
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(tabbarButton *)button
{
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    //调整“+”按钮的frame
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    self.plusButton.center = CGPointMake(w * 0.5, h - 35);
    
    //tabbar按钮的位置
    CGFloat buttonW = w/self.subviews.count;
    CGFloat buttonH = h;
    CGFloat buttonY = 0;
    
    for (int index = 0; index <self.tabBarButtons.count; index ++) {
        //取出按钮
        tabbarButton *button = self.tabBarButtons[index];
        
        //设置按钮的frame
        CGFloat buttonX =  index *buttonW;
        if (index >1) {
            buttonX +=buttonW;
        }
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //绑定tag
        button.tag = index;
    }
}

@end
