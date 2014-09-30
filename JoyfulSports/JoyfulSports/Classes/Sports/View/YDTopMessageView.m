//
//  YDTopMessageView.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDTopMessageView.h"
#import "YDSport.h"

@interface YDTopMessageView ()
@property (nonatomic, weak) UILabel *speedLabel;
@property (nonatomic, weak) UILabel *distanceLabel;
@end

@implementation YDTopMessageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *speedLabel = [[UILabel alloc] init];
        speedLabel.textColor = [UIColor whiteColor];
        speedLabel.textAlignment = NSTextAlignmentCenter;
        speedLabel.text = @"0.0 m/s";
        self.speedLabel = speedLabel;
        [self addSubview:speedLabel];
        
        UILabel *distanceLabel = [[UILabel alloc] init];
        distanceLabel.textColor = [UIColor whiteColor];
        distanceLabel.text = @"0.0 km";
        distanceLabel.textAlignment = NSTextAlignmentCenter;
        self.distanceLabel = distanceLabel;
        [self addSubview:distanceLabel];
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.speedLabel.frame = CGRectMake(10, 0, 100, 35);
    self.distanceLabel.frame = CGRectMake(100, 0, 100, 35);
}

- (void)setSport:(YDSport *)sport
{
    _sport = sport;
    
    //计算时间和路程,显示
    double sprotTime = sport.sportTime / 1000.0;
    double distance = [sport.distance doubleValue];
    if (sprotTime == 0 || distance == 0) {
        return;
    }
    double speed = distance / sprotTime;
    self.distanceLabel.text = [NSString stringWithFormat:@"%.1f km", distance / 1000];
    self.speedLabel.text = [NSString stringWithFormat:@"%.1f m/s", speed];
}

@end
