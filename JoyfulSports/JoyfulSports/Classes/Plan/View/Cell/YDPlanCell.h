//
//  YDPlanCell.h
//  JoyfulSports
//
//  Created by 谢琛 on 14/10/10.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YDCellItem;
@interface YDPlanCell : UITableViewCell
/**
 *  快速创建cell方法
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *  数据模型
 */
@property (nonatomic, strong) YDCellItem *item;

/**
 *  对应的行号
 */
@property (nonatomic, strong) NSIndexPath *indexPath;
/**
 *  传递对应的行号和对应组的总数
 *
 *  @param indexPath 行号
 *  @param totals    总数
 */
@property (nonatomic, assign) BOOL hideDivider;

- (void)setNSIndexPath:(NSIndexPath *)indexPath totals:(NSInteger)totals;
@end
