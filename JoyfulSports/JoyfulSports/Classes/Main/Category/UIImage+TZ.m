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

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
