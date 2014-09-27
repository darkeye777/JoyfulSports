//
//  YDUserTool.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDSportsTool.h"
#import "FMDB.h"
#import "YDSport.h"

@implementation YDSportsTool

static FMDatabase *_db;
+ (void)initialize
{
    // 0.获取沙盒地址
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *sqlFilePath = [path stringByAppendingPathComponent:@"sports.sqlite"];
    
    // 1.加载数据库
    _db = [FMDatabase databaseWithPath:sqlFilePath];
    
    // 2.打开数据库
    if ([_db open]) {
        YDLog(@"打开数据库成功");
        // 3.创建表
        BOOL success = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_sport(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, username TEXT NOT NULL, points BLOB NOT NULL, distance TEXT NOT NULL, time TEXT NOT NULL);"];
        if (success) {
            YDLog(@" 创建表成功");
        } else {
            YDLog(@" 创建表失败");
        }
    } else {
        YDLog(@"打开数据库失败");
    }
}

+ (void)saveSportWithSport:(YDSport *)sport
{
    [_db executeUpdate:@"INSERT INTO t_sport (username, points, distance, time) VALUES (?, ?, ?, ?)", sport.username, sport.points, sport.distance, sport.time];
}

+ (NSArray *)sportWithUsername:(NSString *)username
{
    NSMutableArray *sports = [NSMutableArray array];
    
    FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_sport WHERE username = ?", username];
    while ([set next]) {
        YDSport *sport = [[YDSport alloc] init];
        sport.username = username;
        sport.distance = [set stringForColumn:@"distance"];
        sport.time = [set stringForColumn:@"time"];
        sport.points = [set dataForColumn:@"points"];
        
        [sports addObject:sport];
    }
    
    return sports;
}

@end
