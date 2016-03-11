//
//  WCSliderBanner.m
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import "WCSliderBanner.h"

@interface WCSliderBanner () <
    UIScrollViewDelegate >

@property (strong, nonatomic) UIScrollView *scrollView;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (assign, nonatomic) CGFloat lastProgress;

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

- (void)removeOldViews {
    for (UIView *view in self.contentViews) {
        [view removeFromSuperview];
    }
}

- (void)addContentViews:(NSArray *)contentViews {
    self.scrollView.contentSize = CGSizeMake(self.itemWidth*contentViews.count, CGRectGetHeight(self.bounds));
    int idx = 0;
    for (UIView *view in contentViews) {
        view.frame = CGRectMake(idx*self.itemWidth,
                                0,
                                self.itemWidth,
                                CGRectGetHeight(self.bounds));
        [self.scrollView addSubview:view];
        idx++;
    }
    _contentViews = contentViews;
}

- (NSArray *)contentViewsWithTitles:(NSArray *)titles {
    NSMutableArray *rtns = [NSMutableArray array];
    for (NSString *title in titles) {
        [rtns addObject:[self viewWithTitle:title]];
    }
    return rtns;
}

- (UIView *)viewWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)btnAction:(UIButton *)sender {
    NSInteger selectedIndex = [self.contentViews indexOfObject:sender];
    [self refreshTitlesWithProgress:selectedIndex animated:NO];
    if ([self.delegate respondsToSelector:@selector(sliderBannar:didSelectedProgress:)]) {
        [self.delegate sliderBannar:self didSelectedProgress:selectedIndex];
    }
}

- (void)refreshTitlesWithProgress:(CGFloat)progress animated:(BOOL)animated {
    if (progress == (NSInteger)progress) {
        if (self.selectedIndex != progress) {
            UIButton *lastBtn = self.contentViews[self.selectedIndex];
            UIButton *curBtn = self.contentViews[(NSInteger)progress];
            
            lastBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            [lastBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            curBtn.titleLabel.font = [UIFont boldSystemFontOfSize:24];
            [curBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [self checkAndScrollBannarAtCenterWithProgress:progress];
            self.selectedIndex = progress;
        }
    }
    self.lastProgress = progress;
}

- (void)checkAndScrollBannarAtCenterWithProgress:(CGFloat)progress {
    // 计算一屏显示个数
    NSInteger count = CGRectGetWidth(self.bounds)/self.itemWidth;
    // 单边个数
    NSInteger halfCount = (count - 2 + (count%2 != 0))/2;
    // 计算出中间的offset
    CGPoint cOffset = CGPointZero;
    // 判断是否需要移动
    if ((progress >= halfCount) && (progress <= (count - halfCount - (count%2 == 0)))) {
        // 当前item的位置
        UIButton *curBtn = self.contentViews[(NSInteger)progress];
        // 计算出中间的offset
        cOffset = CGPointMake(curBtn.frame.origin.x - halfCount*self.itemWidth, self.scrollView.contentOffset.y);
    } else if (progress < halfCount) {
        cOffset = CGPointZero;
    } else if (progress >= (count - halfCount - (count%2 == 0))) {
        cOffset = CGPointMake(self.itemWidth*(self.contentViews.count - count), self.scrollView.contentOffset.y);
    }
    [self.scrollView setContentOffset:cOffset animated:YES];
}

- (void)scrollBannarWithProgress:(CGFloat)progress animated:(BOOL)animated {
    CGPoint nOffset = CGPointMake(progress*self.itemWidth, self.scrollView.contentOffset.y) ;
    [self.scrollView setContentOffset:nOffset animated:animated];
}

#pragma mark - UIScrollViewDelegate

#pragma mark - Public
- (void)sliderBannarShouldSelectedProgress:(CGFloat)progress animated:(BOOL)animated {
    [self refreshTitlesWithProgress:progress animated:animated];
}

- (void)setBannarTitles:(NSArray *)bannarTitles {
    [self removeOldViews];
    _bannarTitles = bannarTitles;
    [self addContentViews:[self contentViewsWithTitles:bannarTitles]];
}

- (void)setItemWidth:(CGFloat)itemWidth {
    _itemWidth = itemWidth;
    self.bannarTitles = _bannarTitles;
}

#pragma mark - Getters/Setters
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.pagingEnabled = NO;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.bounces = YES;
        _scrollView = scrollView;
    }
    return _scrollView;
}

@end