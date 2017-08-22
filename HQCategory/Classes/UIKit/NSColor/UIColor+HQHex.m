//
//  UIColor+HQHex.m
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "UIColor+HQHex.h"

@implementation UIColor (HQHex)

/**
 6位 16进制数转颜色 不带透明度
 
 @param hex 6位 16进制数
 @return 颜色
 */
+ (UIColor *)hq_colorWithHex:(UInt32)hex {
    
    return [UIColor hq_colorWithHex:hex alpha:1];
    
}


/**
 6位 16进制数转颜色 带透明度
 
 @param hex 6位 16进制数
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)hq_colorWithHex:(UInt32)hex alpha:(CGFloat)alpha {

    return [UIColor colorWithRed:((hex >> 16) & 0xFF) / 255.0
                           green:((hex >> 8) & 0xFF) / 255.0
                            blue:(hex & 0xFF) / 255.0
                           alpha:alpha];
    
}

+ (UIColor *)hq_colorWithHexString:(NSString *)hexString {

    CGFloat alpha, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = hq_colorComponentFrom(colorString, 0, 1);
            green = hq_colorComponentFrom(colorString, 1, 1);
            blue  = hq_colorComponentFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alpha = hq_colorComponentFrom(colorString, 0, 1);
            red   = hq_colorComponentFrom(colorString, 1, 1);
            green = hq_colorComponentFrom(colorString, 2, 1);
            blue  = hq_colorComponentFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = hq_colorComponentFrom(colorString, 0, 2);
            green = hq_colorComponentFrom(colorString, 2, 2);
            blue  = hq_colorComponentFrom(colorString, 4, 2);
            break;
            
        case 8: // #AARRGGBB
            alpha = hq_colorComponentFrom(colorString, 0, 2);
            red   = hq_colorComponentFrom(colorString, 2, 2);
            green = hq_colorComponentFrom(colorString, 4, 2);
            blue  = hq_colorComponentFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
}

CGFloat hq_colorComponentFrom(NSString *string, NSUInteger start, NSUInteger length) {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@end
