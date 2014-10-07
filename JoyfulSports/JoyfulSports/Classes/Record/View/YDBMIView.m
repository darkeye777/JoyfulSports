//
//  YDBMIView.m
//  JoyfulSports
//
//  Created by Tzhan on 14-10-7.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDBMIView.h"
#import "YDUser.h"

@interface YDBMIView ()
@property (weak, nonatomic) IBOutlet UILabel *BMILabel;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@end

@implementation YDBMIView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"BMIView" owner:nil options:nil][0];
    }
    return self;
}

- (void)setUser:(YDUser *)user
{
    _user = user;

    NSString *msg = nil;
    NSString *bmiStr = [self bmiWithUser:user showMsg:&msg];

    self.BMILabel.text = bmiStr;
    self.showLabel.text = msg;

}

/**
 *  计算BMI
 *
 *  @param user    用户数据
 *  @param showMsg 展示信息
 *
 *  @return BMI
 */
- (NSString *)bmiWithUser:(YDUser *)user showMsg:(NSString **)showMsg
{
    //体质指数（BMI）=体重（kg）÷身高^2（m）
    float weight = [user.weight floatValue];
    float stature = [user.stature floatValue] / 100.0;
    float bmi = weight / (stature * stature);
    
    /*
     成人的BMI数值：
     过轻：低于18.5
     正常：18.5-24.99
     适中：20-25
     过重：25-28
     肥胖：28-32
     非常肥胖, 高于32
     专家指出最理想的体重指数是22。
     */
    if (bmi > 32) {
        *showMsg = @"太胖了,求减肥";
    } else if (bmi >= 28 && bmi < 32) {
        *showMsg = @"比较胖,能减肥吗?";
    } else if (bmi >= 25 && bmi < 28) {
        *showMsg = @"有些重了,锻炼一下吧!";
    } else if (bmi >= 20 && bmi < 25) {
        *showMsg = @"身材不错,好好保持";
    } else if (bmi >= 18.5 && bmi < 24.99) {
        *showMsg = @"正常身材";
    } else if (bmi < 18.5) {
        *showMsg = @"您快能飘了";
    }
    
    return [NSString stringWithFormat:@"%.1f", bmi];
}

@end
