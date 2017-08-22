//
//  NSString+HQBase64.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HQBase64)

+ (NSString *)hq_stringWithBase64EncodedString:(NSString *)string;

- (NSString *)hq_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

- (NSString *)hq_base64EncodedString;

- (NSString *)hq_base64DecodedString;

- (NSData *)hq_base64DecodedData;


@end
