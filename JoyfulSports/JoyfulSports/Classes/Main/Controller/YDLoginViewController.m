//
//  YDLoginViewController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-28.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDLoginViewController.h"
#import "YDTabBarViewController.h"
#import "YDUser.h"
#import "YDSportsTool.h"

@interface YDLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *statureTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation YDLoginViewController
- (IBAction)loginButtonClick {
    //用户信息
    YDUser *user = [[YDUser alloc] init];
    user.username = self.nameTextField.text;
    user.stature = self.statureTextField.text;
    user.weight = self.weightTextField.text;
    user.age = self.ageTextField.text;
    
    //保存用户信息到偏好中
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
    [defaults setObject:data forKey:@"user"];
    [defaults synchronize];
    
    //跳转到主页
    YDTabBarViewController *tabBarVC = [[YDTabBarViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
@end
