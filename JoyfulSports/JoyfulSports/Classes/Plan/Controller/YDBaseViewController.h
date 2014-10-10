//
//  YDBaseViewController.h
//  JoyfulSports
//
//  Created by 谢琛 on 14/10/10.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDCellItem.h"
#import "YDCellGroup.h"
#import "YDCellLabelItem.h"
#import "YDPlanCell.h"
@interface YDBaseViewController : UITableViewController
/**
 *  设置每一组的数据
 */
- (YDCellGroup *)addCellGroup;
/**
 *  根据对应的组的索引返回对应的组模型
 */
- (YDCellGroup *)cellGroupSection:(NSInteger) section;


@end
