//
//  CalendarManager.m
//  IntergratingDemo
//
//  Created by shihaijie on 2/3/16.
//  Copyright © 2016 Saick. All rights reserved.
//

#import "CalendarManager.h"
#import "RCTLog.h"
#import "RCTConvert.h"

@implementation CalendarManager

RCT_EXPORT_MODULE()

//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
//{
//    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
//}

//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)secondsSinceUnixEpoch)
//{
//    NSDate *date = [RCTConvert NSDate:secondsSinceUnixEpoch];
//    RCTLogInfo(@"Pretending to create an event %@ at %@ at:%@", name, location, date);
//}

//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(NSString *)ISO8601DateString)
//{
//    NSDate *date = [RCTConvert NSDate:ISO8601DateString];
//    RCTLogInfo(@"Pretending to create an event %@ at %@ at:%@", name, location, date);
//}

// for auto convert in the future
//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(NSDate *)date)
//{
//    // Date is ready to use!
//}

RCT_EXPORT_METHOD(addEvent:(NSString *)name details:(NSDictionary *)details)
{
    NSString *location = [RCTConvert NSString:details[@"location"]];
    NSDate *time = [RCTConvert NSDate:details[@"time"]];

    RCTLogInfo(@"Pretending to create an event %@ at %@ at:%@", name, location, time);
}

@end
