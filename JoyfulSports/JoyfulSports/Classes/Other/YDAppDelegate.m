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

@interface YDAppDelegate () <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}
@end

@implementation YDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    application.statusBarHidden = NO;
    
    //地图apiKey
    [MAMapServices sharedServices].apiKey =@"e46b6db9cfa968b554ebfb3221eb4762";
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [defaults objectForKey:@"username"];
    
    if (username != nil) {
        YDTabBarViewController *tabBarVC = [[YDTabBarViewController alloc] init];
        self.window.rootViewController = tabBarVC;
    } else {
        UIStoryboard *stroy = [UIStoryboard storyboardWithName:@"LoginSB" bundle:nil];
//        UIViewController *vc = [stroy instantiateInitialViewController];
        self.window.rootViewController = stroy.instantiateInitialViewController;
    }
    
//    UIStoryboard *sportSB = [UIStoryboard storyboardWithName:@"YDSportsSB" bundle:nil];
//    self.window.rootViewController = sportSB.instantiateInitialViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
