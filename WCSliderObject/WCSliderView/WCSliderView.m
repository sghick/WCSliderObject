//
//  WCSliderView.m
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import "WCSliderView.h"

@interface WCSliderView ()

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation WCSliderView

#pragma mark - WCSliderViewDelegate
- (void)sliderViewShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated {
    
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
