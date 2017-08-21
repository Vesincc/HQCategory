//
//  NSArray+HQJson.m
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSArray+HQJson.h"

@implementation NSArray (HQJson)

/**
 数组转 Json 字符串
 
 @return 转换后的字符串
 */
- (NSString *)hq_jsonString {

    if ([NSJSONSerialization isValidJSONObject:self]) {
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    
    }
    
    return nil;

}

@end
