//
//  YDUserTool.h
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YDSport;
@interface YDSportsTool : NSObject
/**
 *  保存记录
 *
 *  @param sport 记录
 */
+ (void)saveSportWithSport:(YDSport *)sport;

/**
 *  得到用户记录
 *
 *  @param username 用户名
 *
 *  @return 全部用户记录
 */
+ (NSArray *)sportWithUsername:(NSString *)username;
@end
