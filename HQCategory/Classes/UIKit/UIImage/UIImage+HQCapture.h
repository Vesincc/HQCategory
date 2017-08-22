//
//  UIImage+HQCapture.h
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HQCapture)

/**
 截图指定view成图片
 
 @param view 截图的view
 @return 截到的图片
 */
+ (UIImage *)hq_captureWithView:(UIView *)view;

@end
