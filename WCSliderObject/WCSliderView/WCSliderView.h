//
//  WCSliderView.h
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCSliderDelegate.h"

@interface WCSliderView : UIView <
WCSliderViewDelegate >

@property (strong, nonatomic) NSArray *contentViews;

@property (weak  , nonatomic) id<WCSliderBannarDelegate> sliderBannarDelegate;

@end
