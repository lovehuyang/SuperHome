//
//  LanchViewController.m
//  HXYMyHome
//
//  Created by 胡小羊 on 17/3/21.
//  Copyright © 2017年 HXY. All rights reserved.
//  启动页

#import "LanchViewManger.h"
#import "LaunchView.h"
#import "HomeViewController.h"
//#import "HXYWebViewController.h"


//广告倒计时间 单位：秒
#define DURATION 5

@interface LanchViewManger ()
@property (nonatomic, weak) LaunchView *launchView;
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation LanchViewManger

+(instancetype)lanchViewController{
   return [[[self class] alloc]init];
}

/**
 加载启动图
 */
- (void)showLanchViewToView:(UIView *)view{
    self.frame = view.bounds;
    [view addSubview:self];
    //加载启动页UI
    [self addADLanchView];
    //加载启动页数据
    [self loadData];
}
- (void)addADLanchView{

    LaunchView *adLaunchView = [[LaunchView alloc]init];
    adLaunchView.skipBtn.hidden = YES;
    adLaunchView.launchImageView.image = [self getLaunchImage];
    adLaunchView.frame=self.bounds;
    [adLaunchView.skipBtn addTarget:self action:@selector(skipADAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:adLaunchView];
    _launchView = adLaunchView;
    _launchView.adImageView.backgroundColor = [UIColor redColor];
}

- (void)loadData{
    
    if ( _adModel.adImgUrl&&_adModel.adImgUrl.length>0) {
        [self showADImageWithURL:[NSURL URLWithString:_adModel.adImgUrl]];
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushAdController)];
        [_launchView addGestureRecognizer:tap];
    }else{
        [self dismissController];
    }
}

- (void)showADImageWithURL:(NSURL *)url
{
    __weak typeof(self) weakSelf = self;
    [_launchView.adImageView  sd_setImageWithURL:url placeholderImage:nil options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 启动倒计时
        [weakSelf scheduledGCDTimer];
    } ];
}

//广告倒计时
- (void)showSkipBtnTitleTime:(int)timeLeave
{
    NSString *timeLeaveStr = [NSString stringWithFormat:@"跳过 %ds",timeLeave];
    [_launchView.skipBtn setTitle:timeLeaveStr forState:UIControlStateNormal];
    _launchView.skipBtn.hidden = NO; 
}
//倒计时
- (void)scheduledGCDTimer
{
    [self cancleGCDTimer];
    __block int timeLeave = DURATION; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    __typeof (self) __weak weakSelf = self;
    dispatch_source_set_event_handler(_timer, ^{
        if(timeLeave <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(weakSelf.timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //关闭界面
                [self dismissController];
            });
        }else{
            int curTimeLeave = timeLeave;
            dispatch_async(dispatch_get_main_queue(), ^{
                //广告倒计时
                [weakSelf showSkipBtnTitleTime:curTimeLeave];
            });
            --timeLeave;
        }
    });
    dispatch_resume(_timer);
}
//跳过广告
- (void)skipADAction{

     [self dismissController];
}
- (void)dismissController
{
    [self cancleGCDTimer];
    //消失动画
    [UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        //缩放修改处
        self.transform = CGAffineTransformMakeScale(1, 1);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)cancleGCDTimer
{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

//跳转至广告详情页面
-(void)pushAdController
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
//        HXYWebViewController * adVc=[[HXYWebViewController alloc]init];
//        adVc.adModel=self.adModel;
//        adVc.hidesBottomBarWhenPushed=YES;
//        [[UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0] pushViewController:adVc animated:YES];
    });
}

- (void)dealloc
{
    [self cancleGCDTimer];
}
-(void)show
{
    [self addADLanchView];
    [self loadData];
}

//获取启动图片
- (UIImage *)getLaunchImage {
    
    UIImage    *lauchImage  = nil;
    NSString    *viewOrientation = nil;
    CGSize     viewSize  = [UIScreen mainScreen].bounds.size;
    UIInterfaceOrientation orientation  = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        
        viewOrientation = @"Landscape";
        
    } else {
        
        viewOrientation = @"Portrait";
    }
    
    NSArray *imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imagesDictionary) {
        
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            
            lauchImage = [UIImage imageNamed:dict[@"UILaunchImageName"]];
        }
    }
    
    return lauchImage;
}
@end
