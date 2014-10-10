//
//  YDCellGroup.h
//  JoyfulSports
//
//  Created by 谢琛 on 14/10/10.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDCellGroup : NSObject
/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *header;
/**
 *  底部标题
 */
@property (nonatomic, copy) NSString *footer;
/**
 *  该组所有的元素
 */
@property (nonatomic, strong) NSArray *items;
@end
