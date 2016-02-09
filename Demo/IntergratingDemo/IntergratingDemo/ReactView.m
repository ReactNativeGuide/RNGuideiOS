//
//  ReactView.m
//  IntergratingDemo
//
//  Created by shihaijie on 2/3/16.
//  Copyright © 2016 Saick. All rights reserved.
//

#import "ReactView.h"
#import "RCTRootView.h"

@interface ReactView ()<RCTRootViewDelegate>

@end

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
    rootView.delegate = self;
}

#pragma mark - RCTRootViewDelegate <NSObject>
/**
 * Called after the root view's content is updated to a new size. The method is not called
 * when both old size and new size have a dimension that equals to zero.
 *
 * The delegate can use this callback to appropriately resize the root view frame to fit the new
 * content view size. The view will not resize itself. The new content size is available via the
 * intrinsicSize propery of the root view.
 */
- (void)rootViewDidChangeIntrinsicSize:(RCTRootView *)rootView
{
    CGRect newFrame = rootView.frame;
    newFrame.size = rootView.intrinsicSize;
    
    rootView.frame = newFrame;
}

@end
