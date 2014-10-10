//
//  YDFirstPlanViewController.m
//  JoyfulSports
//
//  Created by 谢琛 on 14/10/10.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDFirstPlanViewController.h"

@interface YDFirstPlanViewController ()

@end

@implementation YDFirstPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:39.0/255.0 green:53.0/255.0 blue:75.0/255.0 alpha:1.0];
    [self setupItems];
}

- (void)setupItems
{
    /** 0组 */
    [self setupGroup0];
    
    /** 1组 */
    [self setupGroup1];
    
    /** 2组 */
    [self setupGroup2];
    
    /** 3组 */
    [self setupGroup3];
    
    /** 4组 */
    [self setupGroup4];
    [self setupGroup5];
    [self setupGroup6];
}

- (void)setupGroup0
{
    YDCellLabelItem *run = [YDCellLabelItem itemWithIcon:@"like" title:@"跑步"];
    run.text = @"7:00";
    
    YDCellLabelItem *cycle = [YDCellLabelItem itemWithIcon:@"album" title:@"骑车"];
    cycle.text = @"16:00";
    
    YDCellLabelItem *fitness = [YDCellLabelItem itemWithIcon:@"pay" title:@"健身"];
    fitness.text = @"20:00";
    YDCellGroup *group = [self addCellGroup];
    group.items = @[run,cycle,fitness];
    group.header = @"星期一";
}
- (void)setupGroup1
{
    YDCellLabelItem *run = [YDCellLabelItem itemWithIcon:@"like" title:@"跑步"];
    run.text = @"7:00";
    
    YDCellLabelItem *cycle = [YDCellLabelItem itemWithIcon:@"album" title:@"骑车"];
    cycle.text = @"16:00";
    
    YDCellLabelItem *fitness = [YDCellLabelItem itemWithIcon:@"pay" title:@"健身"];
    fitness.text = @"20:00";
    YDCellGroup *group = [self addCellGroup];
    group.items = @[run,cycle,fitness];
    group.header = @"星期二";

}
- (void)setupGroup2
{
    YDCellLabelItem *run = [YDCellLabelItem itemWithIcon:@"like" title:@"跑步"];
    run.text = @"7:00";
    
    YDCellLabelItem *cycle = [YDCellLabelItem itemWithIcon:@"album" title:@"骑车"];
    cycle.text = @"16:00";
    
    YDCellLabelItem *fitness = [YDCellLabelItem itemWithIcon:@"pay" title:@"健身"];
    fitness.text = @"20:00";
    YDCellGroup *group = [self addCellGroup];
    group.items = @[run,cycle,fitness];
    group.header = @"星期三";

}
- (void)setupGroup3
{
    YDCellLabelItem *run = [YDCellLabelItem itemWithIcon:@"like" title:@"跑步"];
    run.text = @"7:00";
    
    YDCellLabelItem *cycle = [YDCellLabelItem itemWithIcon:@"album" title:@"骑车"];
    cycle.text = @"16:00";
    
    YDCellLabelItem *fitness = [YDCellLabelItem itemWithIcon:@"pay" title:@"健身"];
    fitness.text = @"20:00";
    YDCellGroup *group = [self addCellGroup];
    group.items = @[run,cycle,fitness];
    group.header = @"星期四";

}
- (void)setupGroup4
{
    YDCellLabelItem *run = [YDCellLabelItem itemWithIcon:@"like" title:@"跑步"];
    run.text = @"7:00";
    
    YDCellLabelItem *cycle = [YDCellLabelItem itemWithIcon:@"album" title:@"骑车"];
    cycle.text = @"16:00";
    
    YDCellLabelItem *fitness = [YDCellLabelItem itemWithIcon:@"pay" title:@"健身"];
    fitness.text = @"20:00";
    YDCellGroup *group = [self addCellGroup];
    group.items = @[run,cycle,fitness];
    group.header = @"星期五";

}
- (void)setupGroup5
{
    YDCellLabelItem *run = [YDCellLabelItem itemWithIcon:@"like" title:@"跑步"];
    run.text = @"7:00";
    
    YDCellLabelItem *cycle = [YDCellLabelItem itemWithIcon:@"album" title:@"骑车"];
    cycle.text = @"16:00";
    
    YDCellLabelItem *fitness = [YDCellLabelItem itemWithIcon:@"pay" title:@"健身"];
    fitness.text = @"20:00";
    YDCellGroup *group = [self addCellGroup];
    group.items = @[run,cycle,fitness];
    group.header = @"星期六";

}
- (void)setupGroup6
{
    YDCellLabelItem *run = [YDCellLabelItem itemWithIcon:@"like" title:@"跑步"];
    run.text = @"7:00";
    
    YDCellLabelItem *cycle = [YDCellLabelItem itemWithIcon:@"album" title:@"骑车"];
    cycle.text = @"16:00";
    
    YDCellLabelItem *fitness = [YDCellLabelItem itemWithIcon:@"pay" title:@"健身"];
    fitness.text = @"20:00";
    YDCellGroup *group = [self addCellGroup];
    group.items = @[run,cycle,fitness];
    group.header = @"星期日";

}
@end
