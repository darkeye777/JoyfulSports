//
//  YDAppDelegate.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-25.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDAppDelegate.h"
#import "YDTabBarViewController.h"
#import <MAMapKit/MAMapKit.h>

@implementation YDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    application.statusBarHidden = NO;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    YDTabBarViewController *tabBarVC = [[YDTabBarViewController alloc] init];
    self.window.rootViewController = tabBarVC;
    
    //地图apiKey
    [MAMapServices sharedServices].apiKey =@"e46b6db9cfa968b554ebfb3221eb4762";
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
