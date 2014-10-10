//
//  YDPlanViewController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-25.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDPlanViewController.h"
#import "YDBaseViewController.h"
#import "YDFirstPlanViewController.h"
@interface YDPlanViewController ()

@end

@implementation YDPlanViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:39.0/255.0 green:53.0/255.0 blue:75.0/255.0 alpha:1.0];
    // 2.初始化数据模型
    [self setupItems];
    
}

- (void)setupItems
{
    [self setupGroup0];
    
}
- (void)setupGroup0
{
    
    YDCellItem *plan1 = [YDCellItem itemWithIcon:@"draft" title:@"我的计划"];
    
    YDCellItem *plan2 = [YDCellItem itemWithIcon:@"draft" title:@"强化训练计划"];
    plan1.destClass = [YDFirstPlanViewController class];
    
    // 定义一个数组保存当前组所有的数据
    YDCellGroup *group0 = [self addCellGroup];
    group0.items = @[plan1,plan2];
    
}
@end
