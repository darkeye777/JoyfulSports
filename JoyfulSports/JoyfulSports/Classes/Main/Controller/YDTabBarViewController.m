//
//  YDTabBarViewController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-25.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDTabBarViewController.h"
#import "YDRecordViewController.h"
#import "YDCourseViewController.h"
#import "YDSportsViewController.h"
#import "YDPlanViewController.h"
#import "YDMoreViewController.h"
#import "YDNavigationViewController.h"
#import "YDTabBar.h"

@interface YDTabBarViewController () <YDTabBarDelegate>
@property (nonatomic, weak) YDTabBar *customTabBar;
@end

@implementation YDTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //添加子控制器
        YDRecordViewController *recordVC = [[YDRecordViewController alloc] init];
        [self setupChildViewController:recordVC title:@"记录" imageName:@"tabbar_home" selImageName:@"tabbar_home_selected"];
        
        YDCourseViewController *courseVC = [[YDCourseViewController alloc] init];
        [self setupChildViewController:courseVC title:@"教程" imageName:@"tabbar_message_center" selImageName:@"tabbar_message_center_selected"];
        
        YDSportsViewController *sportsVC = [[YDSportsViewController alloc] init];
        [self setupChildViewController:sportsVC title:@"运动" imageName:@"tabbar_compose_button" selImageName:@"tabbar_compose_button_highlighted"];
        sportsVC.view.backgroundColor = [UIColor grayColor];
        
        
        YDPlanViewController *planVC = [[YDPlanViewController alloc] init];
        [self setupChildViewController:planVC title:@"计划" imageName:@"tabbar_discover" selImageName:@"tabbar_discover_selected"];
        
        YDMoreViewController *moreVC = [[YDMoreViewController alloc] init];
        [self setupChildViewController:moreVC title:@"更多" imageName:@"tabbar_profile" selImageName:@"tabbar_profile_selected"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //自定义tabBar
    YDTabBar *customTabBar = [[YDTabBar alloc] init];
    customTabBar.frame = self.tabBar.frame;
    
    //设置代理
    customTabBar.delegate = self;
    
    self.customTabBar = customTabBar;
    [self.view addSubview:customTabBar];
    
    [self.tabBar removeFromSuperview];
    
}

/**
 *  设置子控制器
 *
 *  @param childVc      子控制器
 *  @param title        标题
 *  @param imageName    正常图片
 *  @param selImageName 选中图片
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageWithName:selImageName];
    
    //添加导航
    YDNavigationViewController *nav = [[YDNavigationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    //添加tabBarButton
    [self.customTabBar addTabBarButton:childVc.tabBarItem];
}

#pragma mark - 代理方法
- (void)tabBar:(YDTabBar *)tabBar from:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
