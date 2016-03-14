//
//  WCSliderBar.m
//  WCSliderObject
//
//  Created by buding on 16/3/14.
//  Copyright © 2016年 buding. All rights reserved.
//

#import "WCSliderBar.h"

@interface WCSliderBar () <
UIScrollViewDelegate >

@property (strong, nonatomic) UIScrollView *scrollView;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (assign, nonatomic) CGFloat lastProgress;

@end

@implementation WCSliderBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    // default
    _selectedFont = [UIFont boldSystemFontOfSize:24];
    _selectedTextColor = [UIColor blackColor];
    _normalFont = [UIFont systemFontOfSize:18];
    _normalTextColor = [UIColor grayColor];
    
    [self addSubview:self.scrollView];
}

- (void)layoutSubviews {
    self.scrollView.frame = self.bounds;
    [self refreshItems];
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
    btn.titleLabel.font = self.normalFont;
    [btn setTitleColor:self.normalTextColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)btnAction:(UIButton *)sender {
    NSInteger selectedIndex = [self.contentViews indexOfObject:sender];
    [self refreshTitlesWithProgress:selectedIndex animated:NO];
    if ([self.delegate respondsToSelector:@selector(sliderBar:didSelectedIndex:)]) {
        [self.delegate sliderBar:self didSelectedIndex:selectedIndex];
    }
}

- (void)refreshTitlesWithProgress:(CGFloat)progress animated:(BOOL)animated {
    if (progress == (NSInteger)progress) {
        if (self.selectedIndex != progress) {
            [self refreshItemWithIndex:self.selectedIndex toSelected:NO];
            [self refreshItemWithIndex:(NSInteger)progress toSelected:YES];
            [self checkAndScrollBannarAtCenterWithProgress:progress];
            self.selectedIndex = progress;
        }
    }
    self.lastProgress = progress;
}

- (void)refreshItemWithIndex:(NSInteger)index toSelected:(BOOL)toSelected {
    if ((index < self.contentViews.count) && (index >= 0)) {
        UIButton *btn = self.contentViews[index];
        if (toSelected) {
            btn.titleLabel.font = self.selectedFont;
            [btn setTitleColor:self.selectedTextColor forState:UIControlStateNormal];
        } else {
            btn.titleLabel.font = self.normalFont;
            [btn setTitleColor:self.normalTextColor forState:UIControlStateNormal];
        }
    }
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
- (void)sliderBarShouldScrollToProgress:(CGFloat)progress animated:(BOOL)animated {
    [self refreshTitlesWithProgress:progress animated:animated];
}

- (void)refreshItems {
    [self removeOldViews];
    [self addContentViews:[self contentViewsWithTitles:self.itemTitles]];
    [self refreshItemWithIndex:0 toSelected:YES];
}

- (void)setItemTitles:(NSArray *)itemTitles {
    _itemTitles = itemTitles;
    [self setNeedsLayout];
}

- (void)setItemWidth:(CGFloat)itemWidth {
    _itemWidth = itemWidth;
    [self setNeedsLayout];
}

- (void)setNormalFont:(UIFont *)normalFont {
    _normalFont = normalFont;
    [self setNeedsLayout];
}

- (void)setNormalTextColor:(UIColor *)normalTextColor {
    _normalTextColor = normalTextColor;
    [self setNeedsLayout];
}

- (void)setSelectedFont:(UIFont *)selectedFont {
    _selectedFont = selectedFont;
    [self setNeedsLayout];
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor {
    _selectedTextColor = selectedTextColor;
    [self setNeedsLayout];
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
