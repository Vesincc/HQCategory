//
//  UIButton+HQTouch.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HQTouch)


/**
 设置点击时间间隔
 */
@property (nonatomic, assign) NSTimeInterval timeInterval;


/**
 用于设置单个按钮不需要被hook
 */
@property (nonatomic, assign) BOOL isIgnore;

@end
