//
//  UIImage+TZ.m
//  0903-01-WeiBo
//
//  Created by Tzhan on 14-9-3.
//  Copyright (c) 2014年 Tzhan. All rights reserved.
//

#import "UIImage+TZ.h"

@implementation UIImage (TZ)

+ (instancetype)imageWithName:(NSString *)imageName
{
    UIImage *resultImage = nil;
    
    //如果为iOS7平台，图片末尾加_os7
    if (iOS7) {
        NSString *newImageName = [imageName stringByAppendingString:@"_os7"];
        resultImage = [UIImage imageNamed:newImageName];
    }
    
    //有些图片末尾没有_os7，但iOS7需要用到，加载原名称图片
    if (resultImage == nil) {
        resultImage = [UIImage imageNamed:imageName];
    }
    
    return resultImage;
}


+ (instancetype)resizableImageWithName:(NSString *)imageName
{
    /*
     // 1.创建图片
     UIImage *image = [UIImage imageWithName:imageName];
     // 2.处理图片
     image =  [image stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5];
     // 3.返回图片
     return image;
     */
    
    return [self resizableImageWithName:imageName leftRatio:0.5 topRatio:0.5];
    
    
}
+ (instancetype)resizableImageWithName:(NSString *)imageName leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio
{
    // 1.创建图片
    UIImage *image = [UIImage imageWithName:imageName];
    // 2.处理图片
    CGFloat left = image.size.width * leftRatio;
    CGFloat top = image.size.height * topRatio;
    
    image =  [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
    // 3.返回图片
    return image;
}

@end
