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

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
@end
