//
//  WJSliderScrollView.m
//  WJSliderView
//
//  Created by 谭启宏 on 15/12/18.
//  Copyright © 2015年 谭启宏. All rights reserved.
//

#import "WJSliderScrollView.h"
#import "WJSliderView.h"

@interface WJSliderScrollView ()<UIScrollViewDelegate,WJSliderViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
//@property (nonatomic,strong)WJSliderView *sliderView;

@property (nonatomic,assign)NSInteger arrayCount;
@property (nonatomic,assign)BOOL shoulScroll;
@end

@implementation WJSliderScrollView

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.bounces = NO;
    }
    return _scrollView;
}

- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSArray<UIView *> *)itemArray contentArray:(NSArray<UIView *>*)contentArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self commonInitWithItemArray:itemArray contentArray:contentArray];
    }
    return self;
}

- (void)commonInitWithItemArray:(NSArray<UIView *> *)itemArray contentArray:(NSArray<UIView *>*)contentArray {
    self.arrayCount = itemArray.count;
    
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds)*itemArray.count, CGRectGetHeight(self.bounds));
    [contentArray enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        view.frame = CGRectMake(idx*CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        [self.scrollView addSubview:view];
    }];

    [self addSubview:self.scrollView];
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat f = scrollView.contentOffset.x/self.bounds.size.width;
    if ([self.sliderBannarDelegate respondsToSelector:@selector(sliderBannarShouldSelectedIndex:animated:)]) {
        [self.sliderBannarDelegate sliderBannarShouldSelectedIndex:f animated:YES];
    }
}

#pragma mark - <WJSliderViewDelegate>

- (void)WJSliderViewDidIndex:(NSInteger)index {
    
    [self.scrollView setContentOffset:CGPointMake(index*CGRectGetWidth(self.bounds), self.scrollView.contentOffset.y) animated:YES];
}

#pragma mark - WCSliderBannarDelegate
- (void)sliderViewDidSelectedIndex:(NSInteger)index animated:(BOOL)animated {
    [self.scrollView setContentOffset:CGPointMake(index*CGRectGetWidth(self.bounds), self.scrollView.contentOffset.y) animated:animated];
}

- (void)sliderBannarShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated {
    [self.scrollView setContentOffset:CGPointMake(index*CGRectGetWidth(self.bounds), self.scrollView.contentOffset.y) animated:animated];
}

- (void)setContentViews:(NSArray *)contentViews {
    if (_contentViews) {
        return;
    }
    _contentViews = contentViews;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds)*contentViews.count,
                                             CGRectGetHeight(self.bounds));
    [contentViews enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        view.frame = CGRectMake(idx*CGRectGetWidth(self.bounds),
                                0,
                                CGRectGetWidth(self.bounds),
                                CGRectGetHeight(self.bounds));
        [self.scrollView addSubview:view];
    }];
}

@end
