//
//  YDUser.h
//  JoyfulSports
//
//  Created by Tzhan on 14-9-28.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDUser : NSObject <NSCoding>

@property (nonatomic, copy) NSString *username;
/**
 *  身高
 */
@property (nonatomic, copy) NSString *stature;
/**
 *  体重
 */
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *age;

@end
