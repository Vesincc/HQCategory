//
//  UIColor+HQRandom.m
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "UIColor+HQRandom.h"

@implementation UIColor (HQRandom)

/**
 随机颜色
 
 @return 颜色
 */
+ (UIColor *)hq_randomColor {

    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    
    return randColor;
    
}

@end
