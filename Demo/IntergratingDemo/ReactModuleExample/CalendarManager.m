//
//  CalendarManager.m
//  IntergratingDemo
//
//  Created by shihaijie on 2/3/16.
//  Copyright © 2016 Saick. All rights reserved.
//

#import "CalendarManager.h"
#import "RCTLog.h"

@implementation CalendarManager

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

@end
