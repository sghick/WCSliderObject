//
//  ViewController.m
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import "ViewController.h"
#import "WCSliderBar.h"
#import "WCSliderView.h"

#import "V1ViewController.h"
#import "V2ViewController.h"
#import "V3ViewController.h"
#import "V4ViewController.h"
#import "V5ViewController.h"
#import "V6ViewController.h"
@interface ViewController () <
    WCSliderBarDelegate,
    WCSliderViewDelegate >

@property (nonatomic,strong) WCSliderBar *sliderBar;
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
    
    [self.view addSubview:self.sliderBar];
    [self.view addSubview:self.sliderView];
    
    self.sliderBar.itemWidth = CGRectGetWidth(self.view.bounds)/5.0;
    self.sliderBar.itemTitles = @[@"label1", @"label2", @"label3", @"label4", @"label5", @"label6"];
    self.sliderView.contentViews = @[vc1.view, vc2.view, vc3.view, vc4.view, vc5.view, vc6.view];
}

#pragma mark - WCSliderBannarDelegate, WCSliderBannarDelegate
- (void)sliderBar:(WCSliderBar *)sliderBar didSelectedIndex:(NSInteger)index {
    [self.sliderView sliderViewShouldSelectedProgress:index animated:NO];
}

- (void)sliderView:(WCSliderView *)sliderView didScrollToProgress:(CGFloat)progress {
    [self.sliderBar sliderBarShouldScrollToProgress:progress animated:NO];
}

#pragma mark - Getters/Setters
- (WCSliderBar *)sliderBar {
    if (_sliderBar == nil) {
        WCSliderBar *sliderBar = [[WCSliderBar alloc] initWithFrame:CGRectMake(0,
                                                                               20,
                                                                               CGRectGetWidth(self.view.bounds),
                                                                               50)];
        sliderBar.delegate = self;
        _sliderBar = sliderBar;
    }
    return _sliderBar;
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
