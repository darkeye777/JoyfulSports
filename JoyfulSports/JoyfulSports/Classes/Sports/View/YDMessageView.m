//
//  YDMessageView.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDMessageView.h"
#import "TTCounterLabel.h"

@interface YDMessageView ()
@property (nonatomic, weak) TTCounterLabel *counterLabel;
@end

@implementation YDMessageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        startButton.frame = CGRectMake(30, 20, 80, 35);
        [startButton setTitle:@"开始" forState:UIControlStateNormal];
        [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        startButton.backgroundColor = [UIColor greenColor];
        [startButton addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:startButton];
        
        UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        stopButton.frame = CGRectMake(30, 65, 80, 35);
        [stopButton setTitle:@"结束" forState:UIControlStateNormal];
        [stopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        stopButton.backgroundColor = [UIColor greenColor];
        [stopButton addTarget:self action:@selector(stopButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:stopButton];

        TTCounterLabel *counterLabel = [[TTCounterLabel alloc] init];
        counterLabel.frame = CGRectMake(100, 0, 200, 100);
//        counterLabel.backgroundColor = [UIColor blueColor];
        self.counterLabel = counterLabel;
        [self addSubview:counterLabel];
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)startButtonClick
{
    if ([self.delegate respondsToSelector:@selector(messageView:start:)]) {
        [self.delegate messageView:self start:nil];
    }
    
    [self.counterLabel start];
}

- (void)stopButtonClick
{
    [self.counterLabel stop];
    long stopTime = self.counterLabel.currentValue;
    YDLog(@"stop: %ld", stopTime);
    
}

- (long)currentTime
{
    return self.counterLabel.currentValue;
}
@end
