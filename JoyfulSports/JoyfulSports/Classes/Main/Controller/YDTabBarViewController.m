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
#import "DCPathButton.h"

@interface YDTabBarViewController () <YDTabBarDelegate, DCPathButtonDelegate>
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
        
//        YDSportsViewController *sportsVC = [[YDSportsViewController alloc] init];
//        [self setupChildViewController:sportsVC title:@"运动" imageName:@"tabbar_compose_button" selImageName:@"tabbar_compose_button_highlighted"];

        YDPlanViewController *planVC = [[YDPlanViewController alloc] init];
        [self setupChildViewController:planVC title:@"计划" imageName:@"tabbar_discover" selImageName:@"tabbar_discover_selected"];
        
        YDMoreViewController *moreVC = [[YDMoreViewController alloc] init];
        [self setupChildViewController:moreVC title:@"更多" imageName:@"tabbar_profile" selImageName:@"tabbar_profile_selected"];
        
        [self configureDCPathButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //自定义tabBar

    [self setupCustomTabBar];
    
}

/**
 * 创建自定义tabBar
 */
- (void)setupCustomTabBar
{
    YDTabBar *customTabBar = [[YDTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    // 设置代理
    self.customTabBar.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 遍历tabbar中所有的子控件, 删除不需要的控件
    // UITabBarButton 这个类是私有API,
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:[UIControl class]]) {
            [subView removeFromSuperview];
        }
    }
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

#pragma mark - 弹出按钮
- (void)configureDCPathButton
{
    // Configure center button
    //
    DCPathButton *dcPathButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                           hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    dcPathButton.delegate = self;
    
    // Configure item buttons
    //
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // Add the item button into the center button
    //
    [dcPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];
    
    [self.view addSubview:dcPathButton];
    
}

#pragma mark - DCPathButton Delegate

- (void)itemButtonTappedAtIndex:(NSUInteger)index
{
    NSLog(@"You tap at index : %ld", (unsigned long)index);
    YDSportsViewController *sportsVC = [[YDSportsViewController alloc] init];
    [self presentViewController:sportsVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

@end
