//
//  YDTabBar.m
//  0903-01-WeiBo
//
//  Created by YDhan on 14-9-3.
//  Copyright (c) 2014年 YDhan. All rights reserved.
//

#import "YDTabBar.h"
#import "YDTabBarButton.h"

@interface YDTabBar ()

@property (nonatomic, weak) UIButton *plusBtn;

@property (nonatomic, strong) NSMutableArray *tabBarButtons;

@property (nonatomic, weak) UIButton *currentSelectedBtn;
@end

@implementation YDTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景
        [self setupBg];
    }
    return self;
}

#pragma mark - 设置背景
- (void)setupBg
{
    if (iOS7) {
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
    }
}

#pragma mark - 设置frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupTabBarButtonFrame];
}

#pragma mark - 设置tabBarButton的frame 
- (void)setupTabBarButtonFrame
{
    NSUInteger count = self.tabBarButtons.count;
    CGFloat btnW = self.width / count;
    CGFloat btnH = self.height;
    CGFloat btnY = 0;
    
    for (int i = 0; i < count; i++) {
        CGFloat btnX = i * btnW;

        UIButton *btn = self.tabBarButtons[i];
        
//        if (i >= count / 2) {
//            btnX = (i + 1) * btnW;
//        }
        
        //设置tag
        btn.tag = i;

        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);

    }
}

#pragma mark - 设置tabBar按钮
- (void)addTabBarButton:(UITabBarItem *)item
{

    if ([item.title isEqualToString:@"运动"]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_hilighted"] forState:UIControlStateHighlighted];
        btn.adjustsImageWhenHighlighted = NO;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        btn.tag = 2;
        
        [self btnClick:btn];
        [self addSubview:btn];
        
        [self.tabBarButtons addObject:btn];

    } else {
        YDTabBarButton *btn = [[YDTabBarButton alloc] init];
        btn.item = item;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        [self.tabBarButtons addObject:btn];
        
//        if (self.subviews.count == 1) {
//            [self btnClick:btn];
//        }
    }
}

#pragma mark - 按钮点击
- (void)btnClick:(UIButton *)btn
{
    //代理方法
    if ([self.delegate respondsToSelector:@selector(tabBar:from:to:)]) {
        [self.delegate tabBar:self from:self.currentSelectedBtn.tag to:btn.tag];
    }
    
    self.currentSelectedBtn.selected = NO;
    btn.selected = YES;
    self.currentSelectedBtn = btn;
}

#pragma mark - 懒加载
- (NSMutableArray *)tabBarButtons
{
    if (!_tabBarButtons) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
@end
