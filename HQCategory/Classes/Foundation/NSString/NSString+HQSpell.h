//
//  NSString+HQSpell.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HQSpell)

/**
 汉语转拼音 带音标 带空格
 
 @return 返回带音标的拼音
 */
- (NSString *)hq_spellWithPhoneticSymbol;

/**
 汉语转拼音 带空格
 
 @return 返回不带音标的拼音
 */
- (NSString *)hq_spell;

/**
 汉语转拼音
 
 @return 返回拼音数组
 */
- (NSArray *)hq_spellArray;

/**
 汉语转拼音
 
 @return 返回的拼音各个字之间不带空格分割
 */
- (NSString *)hq_spellWithoutBlank;

/**
 提取汉子拼音首字母
 
 @return 汉子拼音首字母数组
 */
- (NSArray *)hq_spellInitialsArray;

/**
 提取汉子拼音首字母
 
 @return 汉子拼音首字母字符串
 */
- (NSString *)hq_spellInitialsString;

@end
