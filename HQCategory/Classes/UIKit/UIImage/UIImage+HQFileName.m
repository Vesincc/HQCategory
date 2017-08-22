//
//  UIImage+HQFileName.m
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "UIImage+HQFileName.h"

@implementation UIImage (HQFileName)

/**
 根据main bundle中的文件名读取图片
 
 @param name 图片名
 @return 无缓存的图片
 */
+ (UIImage *)hq_imageWithFileName:(NSString *)name {

    return [UIImage hq_imageWithFileName:name inBundle:[NSBundle mainBundle]];
    
}

/**
 根据指定bundle中的文件名读取图片
 
 @param name 图片名
 @param bundle bundle
 @return 无缓存的图片
 */
+ (UIImage *)hq_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle {

    NSString *extension = @"png";
    
    NSArray *components = [name componentsSeparatedByString:@"."];
    if ([components count] >= 2) {
        NSUInteger lastIndex = components.count - 1;
        extension = [components objectAtIndex:lastIndex];
        
        name = [name substringToIndex:(name.length-(extension.length+1))];
    }
    
    // 如果为Retina屏幕且存在对应图片，则返回Retina图片，否则查找普通图片
    if ([UIScreen mainScreen].scale == 2.0) {
        name = [name stringByAppendingString:@"@2x"];
        
        NSString *path = [bundle pathForResource:name ofType:extension];
        if (path != nil) {
            return [UIImage imageWithContentsOfFile:path];
        }
    }
    
    if ([UIScreen mainScreen].scale == 3.0) {
        name = [name stringByAppendingString:@"@3x"];
        
        NSString *path = [bundle pathForResource:name ofType:extension];
        if (path != nil) {
            return [UIImage imageWithContentsOfFile:path];
        }
    }
    
    NSString *path = [bundle pathForResource:name ofType:extension];
    if (path) {
        return [UIImage imageWithContentsOfFile:path];
    }
    
    return nil;
    
}

@end
