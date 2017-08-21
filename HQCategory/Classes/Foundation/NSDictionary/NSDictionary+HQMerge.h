//
//  NSDictionary+HQMerge.h
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HQMerge)


/**
 追加字典

 @param dict 追加字典
 @return 合并后的字典
 */
- (NSDictionary *)hq_dictionaryByMergingWith:(NSDictionary *)dict;
+ (NSDictionary *)hq_dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;


@end
