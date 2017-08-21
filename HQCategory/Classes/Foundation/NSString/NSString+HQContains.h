//
//  NSString+HQContains.h
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (HQContains)


/**
 是否包含中文

 @return YES 包含
 */
- (BOOL)hq_isContainChinese;


/**
 是否包含空格

 @return YES 包含
 */
- (BOOL)hq_isContainBlank;


/**
 words count

 @return count
 */
- (int)hq_wordsCount;

/**
 *  计算属性字符文本占用的宽高
 *  @param font    显示的字体
 *  @param maxSize 最大的显示范围
 *  @param lineSpacing 行间距
 *  @return 占用的宽高
 */
- (CGSize)hq_textRectWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing;

/**
 *  计算属性字符文本占用的宽高
 *  @param font    显示的字体
 *  @param maxWidth 最大的宽度
 *  @return 占用的宽高
 */
- (CGSize)hq_textRectWithFont:(UIFont *)font andMaxWidth:(CGFloat)maxWidth;

/**
 *  计算属性字符文本占用的宽高
 *  @param fontSize 字体大小
 *  @param maxWidth 最大的宽度
 *  @return 占用的宽高
 */
- (CGSize)hq_textRectWithFontSize:(CGFloat)fontSize andMaxWidth:(CGFloat)maxWidth;

@end
