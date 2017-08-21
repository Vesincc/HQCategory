//
//  NSDate+Extension.m
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
* 获取日、月、年、小时、分钟、秒
*/
- (NSUInteger)hq_day {

    return [NSDate hq_day:self];
    
}

- (NSUInteger)hq_month {
    
    return [NSDate hq_month:self];

}

- (NSUInteger)hq_year {
    
    return [NSDate hq_year:self];

}

- (NSUInteger)hq_hour {

    return [NSDate hq_hour:self];
    
}

- (NSUInteger)hq_minute {

    return [NSDate hq_minute:self];
    
}

- (NSUInteger)hq_second {
    
    return [NSDate hq_minute:self];

}

+ (NSUInteger)hq_day:(NSDate *)date {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSCalendarUnitDay
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents day];
    
}

+ (NSUInteger)hq_month:(NSDate *)date {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSCalendarUnitMonth
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents month];
    
}

+ (NSUInteger)hq_year:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSCalendarUnitYear
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents year];

}

+ (NSUInteger)hq_hour:(NSDate *)date {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSCalendarUnitHour
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents hour];
    
}

+ (NSUInteger)hq_minute:(NSDate *)date {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSCalendarUnitMinute
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents minute];
    
}

+ (NSUInteger)hq_second:(NSDate *)date {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSCalendarUnitSecond
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents second];
    
}

/**
 * 获取一年中的总天数
 */
- (NSUInteger)hq_daysInYear {

    return [NSDate hq_daysInYear:self];
    
}

+ (NSUInteger)hq_daysInYear:(NSDate *)date {
    
    return [date hq_isLeapYear] ? 366 : 365;

}

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)hq_isLeapYear {

    return [NSDate hq_isLeapYear:self];
    
}

+ (BOOL)hq_isLeapYear:(NSDate *)date {

    NSInteger year = [date hq_year];
    
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
    
        return YES;
        
    }
    
    return NO;
    
}

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)hq_weekOfYear {

    return [NSDate hq_weekOfYear:self];
    
}

+ (NSUInteger)hq_weekOfYear:(NSDate *)date {

    NSUInteger i;
    NSUInteger year = [date hq_year];
    
    NSDate *lastdate = [date hq_lastdayOfMonth];
    
    for (i = 1;[[lastdate hq_dateAfterDay:-7 * i] hq_year] == year; i++) {
        
    }
    
    return i;
    
}

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)hq_formatYMD {

    return [NSDate hq_formatYMD:self];
    
}


+ (NSString *)hq_formatYMD:(NSDate *)date {

    return [NSString stringWithFormat:@"%lu-%02lu-%02lu",(unsigned long)[date hq_year],(unsigned long)[date hq_month], (unsigned long)[date hq_day]];
    
}

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)hq_weeksOfMonth {

    return [NSDate hq_weeksOfMonth:self];
    
}

+ (NSUInteger)hq_weeksOfMonth:(NSDate *)date {

    return [[date hq_lastdayOfMonth] hq_weekOfYear] - [[date hq_begindayOfMonth] hq_weekOfYear] + 1;
    
}

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)hq_begindayOfMonth {

    return [self hq_begindayOfMonth];
    
}

+ (NSDate *)hq_begindayOfMonth:(NSDate *)date {
    
    return [self hq_dateAfterDate:date day:-[date hq_day] + 1];

}

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)hq_lastdayOfMonth {

    return [self hq_lastdayOfMonth];
    
}

+ (NSDate *)hq_lastdayOfMonth:(NSDate *)date {

    NSDate *lastDate = [self hq_begindayOfMonth:date];
    return [[lastDate hq_dateAfterMonth:1] hq_dateAfterDay:-1];
    
}

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)hq_dateAfterDay:(NSUInteger)day {

    return [self hq_dateAfterDay:day];
    
}

+ (NSDate *)hq_dateAfterDate:(NSDate *)date day:(NSInteger)day {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
    
}

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)hq_dateAfterMonth:(NSUInteger)month {

    return [self hq_dateAfterMonth:month];
    
}

+ (NSDate *)hq_dateAfterDate:(NSDate *)date month:(NSInteger)month {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
    
}

/**
 * 返回numYears年后的日期
 */
- (NSDate *)hq_offsetYears:(int)numYears {

    return [NSDate hq_offsetYears:numYears fromDate:self];
    
}

+ (NSDate *)hq_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {

    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents toDate:fromDate options:0];
    
}

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)hq_offsetMonths:(int)numMonths {

    return [NSDate hq_offsetMonths:numMonths fromDate:self];
    
}

+ (NSDate *)hq_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {

    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents toDate:fromDate options:0];
    
}

/**
 * 返回numDays天后的日期
 */
- (NSDate *)hq_offsetDays:(int)numDays {

    return [NSDate hq_offsetDays:numDays fromDate:self];
    
}

+ (NSDate *)hq_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {

    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents toDate:fromDate options:0];
    
}

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)hq_offsetHours:(int)hours {

    return [NSDate hq_offsetHours:hours fromDate:self];
    
}

+ (NSDate *)hq_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {

    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents toDate:fromDate options:0];
    
}

/**
 * 距离该日期前几天
 */
- (NSUInteger)hq_daysAgo {

    return [NSDate hq_daysAgo:self];
    
}

+ (NSUInteger)hq_daysAgo:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay) fromDate:date toDate:[NSDate date] options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit) fromDate:date toDate:[NSDate date] options:0];
#endif
    
    return [components day];

}

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)hq_weekday {

    return [NSDate hq_weekday:self];
    
}

+ (NSInteger)hq_weekday:(NSDate *)date {

    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;

    
}

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)hq_dayFromWeekday {
    
    return [NSDate hq_dayFromWeekday:self];
    
}

+ (NSString *)hq_dayFromWeekday:(NSDate *)date {

    switch([date hq_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
    
}

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)hq_isSameDay:(NSDate *)anotherDate {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:anotherDate];
    
    return ([components1 year] == [components2 year] && [components1 month] == [components2 month] && [components1 day] == [components2 day]);
    
}

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)hq_isToday {

    return [self hq_isSameDay:[NSDate date]];
    
}

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)hq_dateByAddingDays:(NSUInteger)days {

    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
    
}

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)hq_monthWithMonthNumber:(NSInteger)month {

    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
    
}

/**
 * 根据日期返回字符串
 */
+ (NSString *)hq_stringWithDate:(NSDate *)date format:(NSString *)format {

    return [date hq_stringWithFormat:format];
    
}

- (NSString *)hq_stringWithFormat:(NSString *)format {

    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
    
}

+ (NSDate *)hq_dateWithString:(NSString *)string format:(NSString *)format {

    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
    
}

/**
 * 获取指定月份的天数
 */
- (NSUInteger)hq_daysInMonth:(NSUInteger)month {

    return [NSDate hq_daysInMonth:self month:month];
    
}

+ (NSUInteger)hq_daysInMonth:(NSDate *)date month:(NSUInteger)month {

    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date hq_isLeapYear] ? 29 : 28;
    }
    return 30;
    
}

/**
 * 获取当前月份的天数
 */
- (NSUInteger)hq_daysInMonth {

    return [NSDate hq_daysInMonth:self];
    
}

+ (NSUInteger)hq_daysInMonth:(NSDate *)date {
    
    return [NSDate hq_daysInMonth:date month:[date hq_month]];

}

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)hq_timeInfo {

    return [NSDate hq_timeInfoWithDate:self];

}

+ (NSString *)hq_timeInfoWithDate:(NSDate *)date {
    
    return [self hq_timeInfoWithDateString:[self hq_stringWithDate:date format:[self hq_ymdHmsFormat]]];

}

+ (NSString *)hq_timeInfoWithDateString:(NSString *)dateString {
    
    NSDate *date = [self hq_dateWithString:dateString format:[self hq_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate hq_month] - [date hq_month]);
    int year = (int)([curDate hq_year] - [date hq_year]);
    int day = (int)([curDate hq_day] - [date hq_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate hq_month] == 1 && [date hq_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self hq_daysInMonth:date month:[date hq_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate hq_day] + (totalDays - (int)[date hq_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate hq_month];
            int preMonth = (int)[date hq_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";

}

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)hq_ymdFormat {

    return [NSDate hq_ymdFormat];
    
}

- (NSString *)hq_hmsFormat {

    return [NSDate hq_hmsFormat];
    
}

- (NSString *)hq_ymdHmsFormat {
    
    return [NSDate hq_ymdHmsFormat];

}

+ (NSString *)hq_ymdFormat {
    
    return @"yyyy-MM-dd";

}

+ (NSString *)hq_hmsFormat {
    
    return @"HH:mm:ss";

}

+ (NSString *)hq_ymdHmsFormat {
    
    return [NSString stringWithFormat:@"%@ %@", [NSDate hq_ymdFormat], [NSDate hq_hmsFormat]];

}

@end
