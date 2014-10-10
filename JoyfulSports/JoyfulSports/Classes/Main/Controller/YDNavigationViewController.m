//
//  YDNavigationViewController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-25.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDNavigationViewController.h"

@interface YDNavigationViewController ()

@end

@implementation YDNavigationViewController

+ (void)initialize
{
    //设置导航栏主题
    [self setupNavBarTheme];
    
    //设置按钮主题
    [self setupNavBarButtonItemTheme];
}

#pragma mark - 设置导航栏按钮主题
+ (void)setupNavBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = iOS7 ? [UIColor orangeColor] : [UIColor grayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:iOS7 ? 14 : 12];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
}

#pragma mark - 设置导航栏主题
+ (void)setupNavBarTheme
{
    //取出NavBar
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置标题属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19];
    navBar.translucent = NO;//设置半透明
    navBar.barTintColor = [UIColor colorWithRed:39.0/255.0 green:53.0/255.0 blue:75.0/255.0 alpha:1.0];
    
    [navBar setTitleTextAttributes:attrs];
}

@end
