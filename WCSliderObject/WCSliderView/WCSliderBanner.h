//
//  WCSliderBanner.h
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WCSliderBanner;
@protocol WCSliderBannarDelegate <NSObject>

@required
- (void)sliderBannar:(WCSliderBanner *)sliderBannar didSelectedProgress:(CGFloat)progress;

@end

@interface WCSliderBanner : UIView

@property (strong, nonatomic) NSArray *bannarTitles;
@property (assign, nonatomic) CGFloat itemWidth;
@property (strong, nonatomic) NSArray *contentViews;
@property (weak  , nonatomic) id<WCSliderBannarDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame;

- (void)sliderBannarShouldSelectedProgress:(CGFloat)progress animated:(BOOL)animated;

@end