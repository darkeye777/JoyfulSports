//
//  YDBaseViewController.m
//  JoyfulSports
//
//  Created by 谢琛 on 14/10/10.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDBaseViewController.h"

@interface YDBaseViewController ()
/**
 *  保存所有组的数据
 */
@property (nonatomic, strong) NSMutableArray *groups;
@end

@implementation YDBaseViewController


- (id)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.设置tableview
    [self setupTable];
    
}
/**
 *  设置tableview
 */
- (void)setupTable
{
    // 3.去掉系统自带分割线
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    
    // 设置组与组之间的间隙
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 10;
    
    // 4.设置额外的滚动区域
    if (iOS7) {
        self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    }
}


#pragma mark - 数据源方法
-  (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    YDCellGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    YDPlanCell *cell = [YDPlanCell cellWithTableView:tableView];
    // 2.设置模型
    // 1.从大数组中取出对应组的小数组
    YDCellGroup *group =  self.groups[indexPath.section];
    // 2.从小数组中取出对应行的模型
    YDCellItem *item = group.items[indexPath.row];
    cell.item = item;// 传递数据模型
    [cell setNSIndexPath:indexPath totals:group.items.count];
    // 3.返回cell
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    YDCellGroup *group = self.groups[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    YDCellGroup *group = self.groups[section];
    return group.footer;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.取出点击的组
    YDCellGroup *group = self.groups[indexPath.section];
    // 2.取出点击的行
    YDCellItem *item = group.items[indexPath.row];
    // 3.判断行模型中是否有目标控制器
    if (item.destClass != nil) {
        UIViewController *destVc = [[item.destClass alloc] init];
        // 4.创建控制器,并跳转
        [self.navigationController pushViewController:destVc animated:YES];
    }
    
    // 4.判断行模型中的block是否有值
    if (item.Opertion != nil) {
        item.Opertion();
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


- (YDCellGroup *)addCellGroup
{
    YDCellGroup *group = [[YDCellGroup alloc] init];
    [self.groups addObject:group];
    return group;
}

- (YDCellGroup *)cellGroupSection:(NSInteger)section
{
    return self.groups[section];
}





@end
