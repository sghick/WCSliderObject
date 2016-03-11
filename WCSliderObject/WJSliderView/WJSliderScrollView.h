//
//  WJSliderScrollView.h
//  WJSliderView
//
//  Created by 谭启宏 on 15/12/18.
//  Copyright © 2015年 谭启宏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCSliderDelegate.h"

@interface WJSliderScrollView : UIView <WCSliderDelegate>

@property (strong, nonatomic) NSArray *contentViews;
@property (weak  , nonatomic) id<WCSliderDelegate> sliderBannarDelegate;

- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSArray<UIView *> *)itemArray contentArray:(NSArray<UIView *>*)contentArray;

@end
