//
//  NSDictionary+HQMerge.m
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSDictionary+HQMerge.h"

@implementation NSDictionary (HQMerge)

/**
 追加字典
 
 @param dict 追加字典
 @return 合并后的字典
 */
- (NSDictionary *)hq_dictionaryByMergingWith:(NSDictionary *)dict {

    return [NSDictionary hq_dictionaryByMerging:self with:dict];
    
}

+ (NSDictionary *)hq_dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2 {

    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [dict2 enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if (![dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict1 objectForKey: key] hq_dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
    }];
    return (NSDictionary *) [result mutableCopy];
    
}

@end
