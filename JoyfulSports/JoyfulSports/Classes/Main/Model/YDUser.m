//
//  YDUser.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-28.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDUser.h"

@implementation YDUser

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.stature = [aDecoder decodeObjectForKey:@"stature"];
        self.weight = [aDecoder decodeObjectForKey:@"weight"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.stature forKey:@"stature"];
    [aCoder encodeObject:self.weight forKey:@"weight"];
    [aCoder encodeObject:self.age forKey:@"age"];
}

@end
