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


@protocol WCSliderBannarDelegate <NSObject>

@required
// 在回调中实现

// 在自身类中实现
- (void)sliderBannarShouldSelectedIndex:(NSInteger)index animated:(BOOL)animated;

// 在自身类中实现属性
@property (strong, nonatomic) NSArray *bannarTitles;

@end


@protocol WCSliderViewDelegate <NSObject>

@required
// 在回调中实现
- (void)sliderViewDidSelectedIndex:(NSInteger)index animated:(BOOL)animated;

// 在自身类中实现

// 在自身类中实现属性
@property (strong, nonatomic) NSArray *contentViews;
@property (weak  , nonatomic) id<WCSliderBannarDelegate> sliderBannarDelegate;

@end
