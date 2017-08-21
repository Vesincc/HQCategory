//
//  NSArray+HQBlock.h
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HQBlock)


/**
 遍历数组

 @param block 当前元素
 */
- (void)hq_each:(void (^)(id object))block;


/**
 遍历数组

 @param block 当前元素及index
 */
- (void)hq_eachWithIndex:(void (^)(id object, NSUInteger index))block;

@end
