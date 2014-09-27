//
//  YDMessageView.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDMessageView.h"

@implementation YDMessageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        startButton.frame = CGRectMake(30, 30, 80, 35);
        [startButton setTitle:@"开始" forState:UIControlStateNormal];
        [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        startButton.backgroundColor = [UIColor greenColor];
        [startButton addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:startButton];
    }
    return self;
}

- (void)startButtonClick
{
    if ([self.delegate respondsToSelector:@selector(messageView:start:)]) {
        [self.delegate messageView:self start:nil];
    }
}
@end
