//
//  NSTimer+HQBlock.m
//  HQCategory
//
//  Created by HanQi on 2017/8/21.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSTimer+HQBlock.h"

@implementation NSTimer (HQBlock)

+ (id)hq_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats {

    void (^block)() = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(hq_executeSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
    
}

+ (id)hq_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats {

    void (^block)() = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(hq_executeSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
    
}

+ (void)hq_executeSimpleBlock:(NSTimer *)inTimer;
{
    if([inTimer userInfo])
    {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
