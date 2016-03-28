//
//  WCSliderView.m
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import "WCSliderView.h"

@interface WCSliderView () <
    UIScrollViewDelegate >

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation WCSliderView

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

- (void)removeOldViews {
    for (UIView *view in self.contentViews) {
        [view removeFromSuperview];
    }
}

- (void)addScrollContentViews:(NSArray *)contentViews {
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds)*contentViews.count, CGRectGetHeight(self.bounds));
    int idx = 0;
    for (UIView *view in contentViews) {
        view.frame = CGRectMake(idx*CGRectGetWidth(self.bounds),
                                0,
                                CGRectGetWidth(self.bounds),
                                CGRectGetHeight(self.bounds));
        [self.scrollView addSubview:view];
        idx++;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat progress = scrollView.contentOffset.x/self.bounds.size.width;
    if ([self.delegate respondsToSelector:@selector(sliderView:didScrollToProgress:)]) {
        [self.delegate sliderView:self didScrollToProgress:progress];
    }
}

#pragma mark - Public
- (void)sliderViewShouldSelectedProgress:(CGFloat)progress animated:(BOOL)animated {
    CGPoint nOffset = CGPointMake(progress*CGRectGetWidth(self.bounds), self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:nOffset animated:animated];
}

- (void)setContentViews:(NSArray *)contentViews {
    [self removeOldViews];
    _contentViews = contentViews;
    [self addScrollContentViews:contentViews];
}

- (void)addContentViews:(NSArray *)views {
    self.contentViews = views;
}

- (void)addContentViewControllers:(NSArray<UIViewController *> *)viewControllers
             atRootViewController:(UIViewController *)rootViewController {
    NSMutableArray *views = [NSMutableArray array];
    for (UIViewController *subVC in viewControllers) {
        [rootViewController addChildViewController:subVC];
        [views addObject:subVC.view];
    }
    self.contentViews = views;
}

#pragma mark - Getters/Setters
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.bounces = NO;
        _scrollView = scrollView;
    }
    return _scrollView;
}

@end
