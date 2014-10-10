//
//  UIImage+TZ.h
//  0903-01-WeiBo
//
//  Created by Tzhan on 14-9-3.
//  Copyright (c) 2014年 Tzhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TZ)

/**
 *  根据不同系统返回图片
 *
 *  @param imageName 图片名称
 *
 *  @return 图片
 */
+ (instancetype)imageWithName:(NSString *)imageName;


+ (instancetype)resizableImageWithName:(NSString *)imageName;

/**
 *  根据图片名称创建一张拉伸不变形的图片
 *
 *  @param imageName  图片名称
 *  @param leftRatio  左边不拉伸比例
 *  @param rigthRatio 顶部不拉伸比例
 *
 *  @return 拉伸不变形的图片
 */
+ (instancetype)resizableImageWithName:(NSString *)imageName leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio;
@end
