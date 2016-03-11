//
//  WCSliderDelegate.h
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCSliderDelegate : NSObject
@end

@protocol WCSliderDelegate <NSObject>

@optional
// 在回调中实现
- (void)sliderViewDidSelectedIndex:(NSInteger)index animated:(BOOL)animated;
- (void)sliderBannarDidSelectedIndex:(NSInteger)index animated:(BOOL)animated;
- (void)sliderViewShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated;
- (void)sliderBannarShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated;

@end

@protocol WCSliderBannarDelegate <NSObject>

@required
// 在回调中实现


// 在自身类中实现属性
@property (strong, nonatomic) NSArray *bannarTitles;
@property (weak  , nonatomic) id<WCSliderDelegate> sliderViewDelegate;

- (void)sliderBannarShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated;

@end


@protocol WCSliderViewDelegate <NSObject>

@required

// 在自身类中实现属性
@property (strong, nonatomic) NSArray *contentViews;
@property (weak  , nonatomic) id<WCSliderDelegate> sliderBannarDelegate;

- (void)sliderViewShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated;

@end
