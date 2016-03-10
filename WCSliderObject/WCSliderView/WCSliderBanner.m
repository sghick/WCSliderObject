//
//  WCSliderBanner.m
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import "WCSliderBanner.h"

@interface WCSliderBanner ()

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation WCSliderBanner

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    [self addSubview:self.scrollView];
}

- (void)layoutSubviews {
    self.scrollView.frame = self.bounds;
    [super layoutSubviews];
}

- (void)setBannarTitles:(NSArray *)bannarTitles {
    _bannarTitles = bannarTitles;
    // 移除原来的View
    [self removeOldViews];
}

- (void)removeOldViews {
    
}

#pragma mark - WCSliderBannarDelegate
- (void)sliderBannarShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated {
    
}

#pragma mark - Getters/Setters
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        _scrollView = scrollView;
    }
    return _scrollView;
}

@end