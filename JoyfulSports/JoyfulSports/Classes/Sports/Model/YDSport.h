//
//  YDSport.h
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDSport : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, strong) NSData *points;

@end
