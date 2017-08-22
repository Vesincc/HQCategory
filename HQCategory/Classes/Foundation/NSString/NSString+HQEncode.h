//
//  NSString+HQEncode.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HQEncode)

/**
 url中文转utf-8
 
 @return 转化后的字符串
 */
- (NSString *)hq_urlEncode;


/**
 utf-8转回来
 
 @return 转化后的字符串
 */
- (NSString *)hq_urlDecode;

@end
