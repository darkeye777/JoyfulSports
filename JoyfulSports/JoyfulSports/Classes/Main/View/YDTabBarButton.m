//
//  TZTabBarButton.m
//  0903-01-WeiBo
//
//  Created by Tzhan on 14-9-3.
//  Copyright (c) 2014年 Tzhan. All rights reserved.
//

#import "YDTabBarButton.h"

@implementation YDTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1.设置图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //2.设置标题居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //3.设置标题大小
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        
        //4.设置标题颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark - 设置图片frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.width;
    CGFloat imageH = self.height * 0.6;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

#pragma mark - 设置标题frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = self.height * 0.6;
    CGFloat titleW = self.width;
    CGFloat titleH = self.height - titleY;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted
{}

#pragma mark - 设置按钮元素
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    //标题
    [self setTitle:item.title forState:UIControlStateNormal];
    
    //默认图片
    [self setImage:item.image forState:UIControlStateNormal];
    
    //选中图片
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

@end
