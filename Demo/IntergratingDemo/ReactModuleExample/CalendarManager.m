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
#import "RCTUtils.h"

@implementation CalendarManager

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

//- (dispatch_queue_t)methodQueue
//{
//    return dispatch_queue_create("com.facebook.React.AsyncLocalStorageQueue", DISPATCH_QUEUE_SERIAL);
//}

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

RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
{
    NSArray *events = @[@"test1", @"test2"];
    callback(@[[NSNull null], events]);
//    callback(@[RCTMakeError(@"test", @"test error", @{}), @[]]);
}

RCT_REMAP_METHOD(findEvents,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSArray *events = @[@"asdf"];
    if ([events count]) {
        resolve(events);
    } else {
        reject(@"1", @"asdf", nil);
    }
}

RCT_EXPORT_METHOD(doSomethingExpensive:(NSString *)param callback:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Call long-running code on background thread
        sleep(2);
        // You can invoke callback from any thread/queue
        callback(@[[NSNull null], @[param, @"asdf"]]);
    });
}

// Exporting Constants
- (NSDictionary *)constantsToExport
{
    return @{ @"firstDayOfTheWeek": @"Monday" };
}

@end
