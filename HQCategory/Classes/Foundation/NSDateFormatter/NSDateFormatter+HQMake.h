//
//  NSDateFormatter+HQMake.h
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (HQMake)

+ (NSDateFormatter *)hq_dateFormatterWithFormat:(NSString *)format;

+ (NSDateFormatter *)hq_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;

+ (NSDateFormatter *)hq_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

+ (NSDateFormatter *)hq_dateFormatterWithDateStyle:(NSDateFormatterStyle)style;

+ (NSDateFormatter *)hq_dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;

+ (NSDateFormatter *)hq_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;

+ (NSDateFormatter *)hq_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;

@end
