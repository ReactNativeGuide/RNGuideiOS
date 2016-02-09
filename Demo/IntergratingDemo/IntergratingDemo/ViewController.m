//
//  ViewController.m
//  IntergratingDemo
//
//  Created by shihaijie on 2/2/16.
//  Copyright © 2016 Saick. All rights reserved.
//

#import "ViewController.h"
#import "ReactView.h"
#import "RCTRootView.h"

#import "RCTUIManager.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet ReactView *reactView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self comunicationGuides];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - guides

// Passing properties from native to React Native
- (void)comunicationGuides
{
    NSArray *imageList = @[@"http://foo.com/bar1.png",
                           @"http://foo.com/bar2.png"];
    
    NSDictionary *props = @{@"images" : imageList};
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/ImageBrowserApp.bundle?platform=ios"];
    
    RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation moduleProvider:NULL launchOptions:nil];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                     moduleName:@"ImageBrowserApp"
                                              initialProperties:props];
    
    rootView.appProperties = props;
    
    rootView.frame = CGRectMake(10, 200, 320, 100);
    [self.view addSubview:rootView];
    
    RCTUIManager *uiManager = bridge.uiManager;
    NSLog(@"uiManager:%@", uiManager);
//    [bridge.uiManager setNeedsLayout];
}

@end
