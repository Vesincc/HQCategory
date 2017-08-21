//
//  NSString+HQContains.m
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSString+HQContains.h"

@implementation NSString (HQContains)


/**
 是否包含中文
 
 @return YES 包含
 */
- (BOOL)hq_isContainChinese {

    NSUInteger length = [self length];
    
    for (NSUInteger i = 0; i < length; i++) {
        
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        
        if (strlen(cString) == 3) {
            return YES;
        }
        
    }
    return NO;
    
}


/**
 是否包含空格
 
 @return YES 包含
 */
- (BOOL)hq_isContainBlank {

    NSRange range = [self rangeOfString:@" "];
    
    if (range.location != NSNotFound) {
        
        return YES;
    
    }
    
    return NO;
    
}


/**
 words count
 
 @return count
 */
- (int)hq_wordsCount {
    
    NSInteger n = self.length;
    int i;
    int l = 0, a = 0, b = 0;
    unichar c;
    
    for (i = 0; i < n; i++) {
        
        c = [self characterAtIndex:i];
        if (isblank(c)) {
        
            b++;
        
        } else if (isascii(c)) {
        
            a++;
      
        } else {
        
            l++;
        
        }
    }
    if (a == 0 && l == 0) {
        
        return 0;
    
    }
    
    
    return l + (int)ceilf((float)(a + b) / 2.0);

}

/**
 *  计算属性字符文本占用的宽高
 *  @param font    显示的字体
 *  @param maxSize 最大的显示范围
 *  @param lineSpacing 行间距
 *  @return 占用的宽高
 */
- (CGSize)hq_textRectWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    NSDictionary *dict = @{NSFontAttributeName: font,
                           NSParagraphStyleAttributeName: paragraphStyle};
    
    CGSize sizeToFit = [self boundingRectWithSize:maxSize // 用于计算文本绘制时占据的矩形块
                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                       attributes:dict        // 文字的属性
                                          context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return sizeToFit;
}

/**
 *  计算属性字符文本占用的宽高
 *  @param font    显示的字体
 *  @param maxWidth 最大的宽度
 *  @return 占用的宽高
 */
- (CGSize)hq_textRectWithFont:(UIFont *)font andMaxWidth:(CGFloat)maxWidth {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    NSDictionary *dict = @{NSFontAttributeName: font,
                           NSParagraphStyleAttributeName: paragraphStyle};
    
    CGSize sizeToFit = [self boundingRectWithSize:(CGSize){maxWidth, MAXFLOAT} // 用于计算文本绘制时占据的矩形块
                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                       attributes:dict        // 文字的属性
                                          context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return sizeToFit;
    
}

/**
 *  计算属性字符文本占用的宽高
 *  @param fontSize 显示的字体
 *  @param maxWidth 最大的宽度
 *  @return 占用的宽高
 */
- (CGSize)hq_textRectWithFontSize:(CGFloat)fontSize andMaxWidth:(CGFloat)maxWidth {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    NSDictionary *dict = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                           NSParagraphStyleAttributeName: paragraphStyle};
    
    CGSize sizeToFit = [self boundingRectWithSize:(CGSize){maxWidth, MAXFLOAT} // 用于计算文本绘制时占据的矩形块
                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                       attributes:dict        // 文字的属性
                                          context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return sizeToFit;
    
}

@end
