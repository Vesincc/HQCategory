//
//  NSString+HQSpell.m
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSString+HQSpell.h"

@implementation NSString (HQSpell)

/**
 汉语转拼音 带音标 带空格
 
 @return 返回带音标的拼音
 */
- (NSString *)hq_spellWithPhoneticSymbol {
    
    NSMutableString *spell = [NSMutableString stringWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)(spell), NULL, kCFStringTransformMandarinLatin, NO);
    return spell;

}

/**
 汉语转拼音 带空格
 
 @return 返回不带音标的拼音
 */
- (NSString *)hq_spell {

    NSMutableString *spell = [NSMutableString stringWithString:[self hq_spellWithPhoneticSymbol]];
    CFStringTransform((__bridge CFMutableStringRef)(spell), NULL, kCFStringTransformStripCombiningMarks, NO);
    return spell;
    
}

/**
 汉语转拼音
 
 @return 返回拼音数组
 */
- (NSArray *)hq_spellArray {

    NSArray *array = [[self hq_spell] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return array;
    
}

/**
 汉语转拼音
 
 @return 返回的拼音各个字之间不带空格分割
 */
- (NSString *)hq_spellWithoutBlank {
    
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString *str in [self hq_spellArray]) {
        [string appendString:str];
    }
    return string;

}

/**
 提取汉子拼音首字母
 
 @return 汉子拼音首字母数组
 */
- (NSArray *)hq_spellInitialsArray {
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *str in [self hq_spellArray]) {
        if ([str length] > 0) {
            [array addObject:[str substringToIndex:1]];
        }
    }
    return array;

}

/**
 提取汉子拼音首字母
 
 @return 汉子拼音首字母字符串
 */
- (NSString *)hq_spellInitialsString {

    NSMutableString *pinyin = [NSMutableString stringWithString:@""];
    for (NSString *str in [self hq_spellArray]) {
        if ([str length] > 0) {
            [pinyin appendString:[str substringToIndex:1]];
        }
    }
    return pinyin;
    
}

@end
