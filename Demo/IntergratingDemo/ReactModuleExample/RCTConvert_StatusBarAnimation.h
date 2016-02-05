//
//  RCTConvert_StatusBarAnimation.h
//  IntergratingDemo
//
//  Created by shihaijie on 2/5/16.
//  Copyright © 2016 Saick. All rights reserved.
//

#import "RCTConvert.h"

@interface RCTConvert ()

@end

@implementation RCTConvert (StatusBarAnimation)
RCT_ENUM_CONVERTER(UIStatusBarAnimation, (@{ @"statusBarAnimationNone" : @(UIStatusBarAnimationNone),
                                             @"statusBarAnimationFade" : @(UIStatusBarAnimationFade),
                                             @"statusBarAnimationSlide" : @(UIStatusBarAnimationSlide)},
                                          UIStatusBarAnimationNone, integerValue)
                   @end
