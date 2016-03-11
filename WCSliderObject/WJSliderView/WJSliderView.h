//
//  WJSliderView.h
//  WJSliderView
//
//  Created by 谭启宏 on 15/12/18.
//  Copyright © 2015年 谭启宏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCSliderDelegate.h"

//滑动视图,1,2,3,4或者1,2,3或者1,2类型的

@protocol WJSliderViewDelegate <NSObject>

- (void)WJSliderViewDidIndex:(NSInteger)index;

@end

@interface WJSliderView : UIView<WCSliderDelegate>

@property (nonatomic,assign)CGFloat indexProgress;

- (instancetype)initWithFrame:(CGRect)frame Array:(NSArray<UIView *> *)array;

@property (nonatomic,assign)id<WJSliderViewDelegate>delegate;

@property (strong, nonatomic) NSArray *bannarTitles;
@property (weak  , nonatomic) id<WCSliderDelegate> sliderViewDelegate;


@end
