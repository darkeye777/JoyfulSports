//
//  TZTabBar.h
//  0903-01-WeiBo
//
//  Created by Tzhan on 14-9-3.
//  Copyright (c) 2014年 Tzhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YDTabBar;
@protocol YDTabBarDelegate <NSObject>

- (void)tabBar:(YDTabBar *)tabBar from:(NSInteger)from to:(NSInteger)to;

@end

@interface YDTabBar : UIView

- (void)addTabBarButton:(UITabBarItem *)item;

@property (nonatomic, weak) id<YDTabBarDelegate> delegate;

@end
