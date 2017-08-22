//
//  UIImage+HQAntialias.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HQAntialias)


/**
 *  缩放动画会出现锯齿 用这个方法来抗锯齿
 *  相当于layer.allowsEdgeAntialiasing = true
 *
 *  @return 返回抗锯齿的image
 */
- (UIImage *)hq_antialias;

@end
