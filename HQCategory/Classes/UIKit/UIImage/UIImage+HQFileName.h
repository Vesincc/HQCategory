//
//  UIImage+HQFileName.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HQFileName)

/**
 根据main bundle中的文件名读取图片
 
 @param name 图片名
 @return 无缓存的图片
 */
+ (UIImage *)hq_imageWithFileName:(NSString *)name;

/**
 根据指定bundle中的文件名读取图片
 
 @param name 图片名
 @param bundle bundle
 @return 无缓存的图片
 */
+ (UIImage *)hq_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;

@end
