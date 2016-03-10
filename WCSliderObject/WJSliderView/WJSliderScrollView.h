//
//  WJSliderScrollView.h
//  WJSliderView
//
//  Created by 谭启宏 on 15/12/18.
//  Copyright © 2015年 谭启宏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCSliderDelegate.h"

@interface WJSliderScrollView : UIView <WCSliderViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSArray<UIView *> *)itemArray contentArray:(NSArray<UIView *>*)contentArray;

@end
