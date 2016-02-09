//
//  ReactView.m
//  IntergratingDemo
//
//  Created by shihaijie on 2/3/16.
//  Copyright © 2016 Saick. All rights reserved.
//

#import "ReactView.h"
#import "RCTRootView.h"

@implementation ReactView

- (void)awakeFromNib {
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/componentIndex.ios.bundle?platform=ios"];
    // For production use, this `NSURL` could instead point to a pre-bundled file on disk:
    //
//    NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    //
    // To generate that file, run the curl command and add the output to your main Xcode build target:
    //
    //   curl http://localhost:8081/componentIndex.ios.bundle?platform=ios -o main.jsbundle
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName: @"SimpleApp"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    
    [self addSubview:rootView];
    rootView.frame = self.bounds;
    
    rootView.sizeFlexibility = RCTRootViewSizeFlexibilityWidthAndHeight;
}

@end
