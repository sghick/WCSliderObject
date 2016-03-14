//
//  WCSliderBar.h
//  WCSliderObject
//
//  Created by buding on 16/3/14.
//  Copyright © 2016年 buding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WCSliderBar;
@protocol WCSliderBarDelegate <NSObject>

@required
- (void)sliderBar:(WCSliderBar *)sliderBar didSelectedIndex:(NSInteger)index;

@end

@interface WCSliderBar : UIView

@property (strong, nonatomic) NSArray *itemTitles;
@property (assign, nonatomic) CGFloat itemWidth;
@property (strong, nonatomic) NSArray *contentViews;
@property (weak  , nonatomic) id<WCSliderBarDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame;

- (void)sliderBarShouldScrollToProgress:(CGFloat)progress animated:(BOOL)animated;

@end