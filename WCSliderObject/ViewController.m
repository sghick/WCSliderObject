//
//  ViewController.m
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import "ViewController.h"
#import "WCSliderBanner.h"
#import "WCSliderView.h"

#import "WJSliderView.h"
#import "WJSliderScrollView.h"

#import "V1ViewController.h"
#import "V2ViewController.h"
#import "V3ViewController.h"
#import "V4ViewController.h"
#import "V5ViewController.h"
#import "V6ViewController.h"
@interface ViewController () <
    WCSliderBannarDelegate,
    WCSliderViewDelegate >

@property (nonatomic,strong) WCSliderBanner *sliderBanner;
@property (nonatomic,strong) WCSliderView *sliderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    V1ViewController *vc1 = [[V1ViewController alloc] init];
    V2ViewController *vc2 = [[V2ViewController alloc] init];
    V3ViewController *vc3 = [[V3ViewController alloc] init];
    V4ViewController *vc4 = [[V4ViewController alloc] init];
    V5ViewController *vc5 = [[V5ViewController alloc] init];
    V6ViewController *vc6 = [[V6ViewController alloc] init];
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor greenColor];
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor yellowColor];
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor grayColor];
    
    UILabel *label1 = [UILabel new];
    UILabel *label2 = [UILabel new];
    UILabel *label3 = [UILabel new];
    UILabel *label4 = [UILabel new];
    UILabel *label5 = [UILabel new];
    UILabel *label6 = [UILabel new];
    
    label1.text = @"label1";
    label2.text = @"label2";
    label3.text = @"label3";
    label4.text = @"label4";
    label5.text = @"label5";
    label6.text = @"label6";
    
    label1.textAlignment = NSTextAlignmentCenter;
    label2.textAlignment = NSTextAlignmentCenter;
    label3.textAlignment = NSTextAlignmentCenter;
    label4.textAlignment = NSTextAlignmentCenter;
    label5.textAlignment = NSTextAlignmentCenter;
    label6.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.sliderBanner];
    [self.view addSubview:self.sliderView];
    
    self.sliderBanner.bannarTitles = @[@"label1", @"label2", @"label3", @"label4", @"label5", @"label6"];
    self.sliderBanner.itemWidth = CGRectGetWidth(self.view.bounds)/4.0;
    self.sliderView.contentViews = @[vc1.view, vc2.view, vc3.view, vc4.view, vc5.view, vc6.view];
}

#pragma mark - WCSliderBannarDelegate, WCSliderBannarDelegate
- (void)sliderBannar:(WCSliderBanner *)sliderBannar didSelectedProgress:(CGFloat)progress {
    [self.sliderView sliderViewShouldSelectedProgress:progress animated:NO];
}

- (void)sliderView:(WCSliderView *)sliderView didSelectedProgress:(CGFloat)progress {
    [self.sliderBanner sliderBannarShouldSelectedProgress:progress animated:NO];
}

#pragma mark - Getters/Setters
- (WCSliderBanner *)sliderBanner {
    if (_sliderBanner == nil) {
        WCSliderBanner *sliderBanner = [[WCSliderBanner alloc] initWithFrame:CGRectMake(0,
                                                                                        20,
                                                                                        CGRectGetWidth(self.view.bounds),
                                                                                        50)];
        sliderBanner.delegate = self;
        _sliderBanner = sliderBanner;
    }
    return _sliderBanner;
}

- (WCSliderView *)sliderView {
    if (_sliderView == nil) {
        WCSliderView *sliderView = [[WCSliderView alloc] initWithFrame:CGRectMake(0,
                                                                                  70,
                                                                                  CGRectGetWidth(self.view.bounds),
                                                                                  CGRectGetHeight(self.view.bounds) - 70)];
        sliderView.delegate = self;
        _sliderView = sliderView;
    }
    return _sliderView;
}

@end
