//
//  NSTimer+HQExtension.h
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (HQExtension)

- (void)hq_pauseTimer;

- (void)hq_resumeTimer;

- (void)hq_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
