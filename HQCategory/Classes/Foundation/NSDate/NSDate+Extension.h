//
//  NSDate+Extension.h
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)


/**
 获取 日

 @return 日期中的日
 */
- (NSUInteger)hq_day;

/**
 获取 月

 @return 日期中的月份
 */
- (NSUInteger)hq_month;


/**
 获取 年

 @return 日期中的年份
 */
- (NSUInteger)hq_year;


/**
 获取 时

 @return 日期中的时
 */
- (NSUInteger)hq_hour;


/**
 获取 分

 @return 日期中的分
 */
- (NSUInteger)hq_minute;


/**
 获取 秒

 @return 日期中的秒
 */
- (NSUInteger)hq_second;

+ (NSUInteger)hq_day:(NSDate *)date;
+ (NSUInteger)hq_month:(NSDate *)date;
+ (NSUInteger)hq_year:(NSDate *)date;
+ (NSUInteger)hq_hour:(NSDate *)date;
+ (NSUInteger)hq_minute:(NSDate *)date;
+ (NSUInteger)hq_second:(NSDate *)date;

/**
 获取一年中的总天数

 @return 总天数
 */
- (NSUInteger)hq_daysInYear;
+ (NSUInteger)hq_daysInYear:(NSDate *)date;


/**
 判断是否为闰年

 @return YES表示润年，NO表示平年
 */
- (BOOL)hq_isLeapYear;
+ (BOOL)hq_isLeapYear:(NSDate *)date;


/**
 获取该日期是该年的第几周

 @return 第几周
 */
- (NSUInteger)hq_weekOfYear;
+ (NSUInteger)hq_weekOfYear:(NSDate *)date;


/**
 获取格式化为YYYY-MM-dd格式的日期字符串

 @return 格式化日期字符串
 */
- (NSString *)hq_formatYMD;
+ (NSString *)hq_formatYMD:(NSDate *)date;


/**
 获取当前月的周数(可能为4,5,6)

 @return 周数
 */
- (NSUInteger)hq_weeksOfMonth;
+ (NSUInteger)hq_weeksOfMonth:(NSDate *)date;


/**
 获取该月的第一天的日期

 @return 第一天日期
 */
- (NSDate *)hq_begindayOfMonth;
+ (NSDate *)hq_begindayOfMonth:(NSDate *)date;


/**
 获取该月的最后一天的日期

 @return 最后一天日期
 */
- (NSDate *)hq_lastdayOfMonth;
+ (NSDate *)hq_lastdayOfMonth:(NSDate *)date;



/**
 返回day天后的日期(若day为负数,则为|day|天前的日期)

 @param day 天数
 @return 日期
 */
- (NSDate *)hq_dateAfterDay:(NSUInteger)day;
+ (NSDate *)hq_dateAfterDate:(NSDate *)date day:(NSInteger)day;


/**
 返回month月后的日期(若month为负数,则为|month|天前的日期)

 @param month 月数
 @return 日期
 */
- (NSDate *)hq_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)hq_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)hq_offsetYears:(int)numYears;
+ (NSDate *)hq_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)hq_offsetMonths:(int)numMonths;
+ (NSDate *)hq_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)hq_offsetDays:(int)numDays;
+ (NSDate *)hq_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)hq_offsetHours:(int)hours;
+ (NSDate *)hq_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)hq_daysAgo;
+ (NSUInteger)hq_daysAgo:(NSDate *)date;

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
- (NSInteger)hq_weekday;
+ (NSInteger)hq_weekday:(NSDate *)date;

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
- (NSString *)hq_dayFromWeekday;
+ (NSString *)hq_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)hq_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)hq_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)hq_dateByAddingDays:(NSUInteger)days;

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
+ (NSString *)hq_monthWithMonthNumber:(NSInteger)month;

 

/**
 获取日期格式化字符串

 @param date 日期
 @param format 日期格式
 @return 字符串
 */
+ (NSString *)hq_stringWithDate:(NSDate *)date format:(NSString *)format;


/**
 获取日期格式化字符串

 @param format 日期格式
 @return 字符串
 */
- (NSString *)hq_stringWithFormat:(NSString *)format;


/**
 字符串转日期

 @param string 字符串
 @param format 日期格式
 @return 日期
 */
+ (NSDate *)hq_dateWithString:(NSString *)string format:(NSString *)format;

 

/**
 获取日期指定月份的天数

 @param month 月份
 @return 天数
 */
- (NSUInteger)hq_daysInMonth:(NSUInteger)month;
+ (NSUInteger)hq_daysInMonth:(NSDate *)date month:(NSUInteger)month;


/**
 获取日期月份的天数

 @return 天数
 */
- (NSUInteger)hq_daysInMonth;
+ (NSUInteger)hq_daysInMonth:(NSDate *)date;


/**
 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前

 @return 信息字符串
 */
- (NSString *)hq_timeInfo;
+ (NSString *)hq_timeInfoWithDate:(NSDate *)date;
+ (NSString *)hq_timeInfoWithDateString:(NSString *)dateString;


/**
 获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串

 @return 格式字符串
 */
- (NSString *)hq_ymdFormat;
- (NSString *)hq_hmsFormat;
- (NSString *)hq_ymdHmsFormat;
+ (NSString *)hq_ymdFormat;
+ (NSString *)hq_hmsFormat;
+ (NSString *)hq_ymdHmsFormat;


@end
