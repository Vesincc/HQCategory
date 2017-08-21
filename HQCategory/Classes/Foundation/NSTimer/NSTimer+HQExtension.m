//
//  NSTimer+HQExtension.m
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSTimer+HQExtension.h"

@implementation NSTimer (HQExtension)

-(void)hq_pauseTimer {
    
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)hq_resumeTimer {
    
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)hq_resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
