//
//  WCSliderView.h
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WCSliderView;
@protocol WCSliderViewDelegate <NSObject>

@required
- (void)sliderView:(WCSliderView *)sliderView didScrollToProgress:(CGFloat)progress;

@end

@interface WCSliderView : UIView

@property (strong, nonatomic) NSArray *contentViews;

@property (weak  , nonatomic) id<WCSliderViewDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame;

/** 常规的view */
- (void)addContentViews:(NSArray *)views;
/** 加载viewController */
- (void)addContentViewControllers:(NSArray<UIViewController *> *)viewControllers
             atRootViewController:(UIViewController *)rootViewController;

- (void)sliderViewShouldSelectedProgress:(CGFloat)progress animated:(BOOL)animated;

@end
