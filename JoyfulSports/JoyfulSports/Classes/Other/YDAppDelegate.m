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
#import "YDUser.h"

@interface YDAppDelegate () <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}
@end

@implementation YDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    application.statusBarHidden = NO;
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    //地图apiKey
    [MAMapServices sharedServices].apiKey =@"e46b6db9cfa968b554ebfb3221eb4762";
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *userdata = [defaults objectForKey:@"user"];
    YDUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:userdata];
    
    if (user.username != nil) {
        YDTabBarViewController *tabBarVC = [[YDTabBarViewController alloc] init];
        self.window.rootViewController = tabBarVC;
    } else {
        UIStoryboard *stroy = [UIStoryboard storyboardWithName:@"LoginSB" bundle:nil];
        self.window.rootViewController = stroy.instantiateInitialViewController;
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
