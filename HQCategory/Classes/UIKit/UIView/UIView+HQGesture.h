//
//  UIView+HQGesture.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HQGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (HQGesture)

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)hq_addTapActionWithBlock:(HQGestureActionBlock)block;

/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)hq_addLongPressActionWithBlock:(HQGestureActionBlock)block;

@end
