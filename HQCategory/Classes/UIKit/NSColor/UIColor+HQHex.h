//
//  UIColor+HQHex.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HQHex)

/**
 6位 16进制数转颜色 不带透明度
 
 @param hex 6位 16进制数
 @return 颜色
 */
+ (UIColor *)hq_colorWithHex:(UInt32)hex;
/**
 6位 16进制数转颜色 带透明度
 
 @param hex 6位 16进制数
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)hq_colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;

+ (UIColor *)hq_colorWithHexString:(NSString *)hexString;

@end
