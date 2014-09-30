//
//  YDMessageView.h
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YDMessageView;
@protocol YDMessageViewDelegate <NSObject>

- (void)messageView:(YDMessageView *)msgView start:(UIButton *)start;

@end


@interface YDMessageView : UIView


@property (nonatomic, weak) id<YDMessageViewDelegate> delegate;

- (long)currentTime;
@end
