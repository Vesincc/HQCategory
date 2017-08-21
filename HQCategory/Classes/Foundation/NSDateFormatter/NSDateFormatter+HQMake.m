//
//  NSDateFormatter+HQMake.m
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSDateFormatter+HQMake.h"

@implementation NSDateFormatter (HQMake)

+ (NSDateFormatter *)hq_dateFormatterWithFormat:(NSString *)format {
    
    return [self hq_dateFormatterWithFormat:format timeZone:nil];

}

+ (NSDateFormatter *)hq_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone {
    
    return [self hq_dateFormatterWithFormat:format timeZone:timeZone locale:nil];

}

+ (NSDateFormatter *)hq_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    
    if (format == nil || [format isEqualToString:@""]) return nil;
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-tz-%@-fmt-%@-loc-%@", [timeZone abbreviation], format, [locale localeIdentifier]];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:format];
        [dictionary setObject:dateFormatter forKey:key];
#if !__has_feature(objc_arc)
        [dateFormatter autorelease];
#endif
    }
    if (locale != nil) [dateFormatter setLocale:locale]; // this may change so don't cache
    if (timeZone != nil) [dateFormatter setTimeZone:timeZone]; // this may change
    return dateFormatter;
    
}

+ (NSDateFormatter *)hq_dateFormatterWithDateStyle:(NSDateFormatterStyle)style {
    
    return [self hq_dateFormatterWithDateStyle:style timeZone:nil];

}

+ (NSDateFormatter *)hq_dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone {
    
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-%@-dateStyle-%d", [timeZone abbreviation], (int)style];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:style];
        [dictionary setObject:dateFormatter forKey:key];
#if !__has_feature(objc_arc)
        [dateFormatter autorelease];
#endif
    }
    if (timeZone != nil) [dateFormatter setTimeZone:timeZone]; // this may change so don't cache
    return dateFormatter;

}

+ (NSDateFormatter *)hq_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style {
    
    return [self hq_dateFormatterWithTimeStyle:style timeZone:nil];

}

+(NSDateFormatter *)hq_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone {
    
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-%@-timeStyle-%d", [timeZone abbreviation], (int)style];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:style];
        [dictionary setObject:dateFormatter forKey:key];
#if !__has_feature(objc_arc)
        [dateFormatter autorelease];
#endif
    }
    if (timeZone != nil) [dateFormatter setTimeZone:timeZone]; // this may change so don't cache
    return dateFormatter;

}

@end
