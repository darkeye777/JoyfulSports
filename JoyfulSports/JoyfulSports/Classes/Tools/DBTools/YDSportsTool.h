//
//  YDUserTool.h
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YDSport, YDUser;
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

/**
 *  保存用户信息
 *
 *  @param user 用户
 */
+ (void)saveUserWithUser:(YDUser *)user;
@end
