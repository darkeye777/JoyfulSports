//
//  YDCellItem.h
//  JoyfulSports
//
//  Created by 谢琛 on 14/10/10.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDCellItem : NSObject
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  子标题
 */
@property (nonatomic, copy) NSString *subtitle;
/**
 *  目标控制器
 */
@property (nonatomic, assign) Class destClass;
/**
 *  保存将来需要执行的代码
 */
@property (nonatomic, copy)  void (^Opertion)();

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title;
@end
