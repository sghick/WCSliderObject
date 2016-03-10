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


@protocol WCSliderViewDelegate <NSObject>

@optional
// 在回调中实现
- (void)sliderViewDidSelectedIndex:(NSInteger)index animated:(BOOL)animated;
// 在自身类中实现
- (void)sliderViewShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated;

@end


@protocol WCSliderBannarDelegate <NSObject>

@optional
// 在回调中实现
- (void)sliderBannarDidSelectedIndex:(NSInteger)index animated:(BOOL)animated;
// 在自身类中实现
- (void)sliderBannarShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated;

@end
