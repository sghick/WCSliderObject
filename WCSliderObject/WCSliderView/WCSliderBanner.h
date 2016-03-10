//
//  WCSliderBanner.h
//  WCSliderObject
//
//  Created by buding on 16/3/10.
//  Copyright © 2016年 buding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCSliderDelegate.h"

@interface WCSliderBanner : UIView <
    WCSliderBannarDelegate >

@property (strong, nonatomic) NSArray *bannarTitles;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame;

@end