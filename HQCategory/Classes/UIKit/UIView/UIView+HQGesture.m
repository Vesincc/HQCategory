//
//  UIView+HQGesture.m
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "UIView+HQGesture.h"
#import <objc/runtime.h>


static char q_actionHandlerTapBlockKey;
static char q_actionHandlerTapGestureKey;
static char q_actionHandlerLongPressBlockKey;
static char q_actionHandlerLongPressGestureKey;

@implementation UIView (HQGesture)

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)hq_addTapActionWithBlock:(HQGestureActionBlock)block {

    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &q_actionHandlerTapGestureKey);
    
    if (!gesture) {
        
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hq_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &q_actionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &q_actionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
    
}

/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)hq_addLongPressActionWithBlock:(HQGestureActionBlock)block {

    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &q_actionHandlerLongPressGestureKey);
    
    if (!gesture) {
        
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(hq_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &q_actionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    
    }
    
    objc_setAssociatedObject(self, &q_actionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
    
}

- (void)hq_handleActionForTapGesture:(UITapGestureRecognizer*)gesture {
    
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        
        HQGestureActionBlock block = objc_getAssociatedObject(self, &q_actionHandlerTapBlockKey);
        
        if (block) {
            
            block(gesture);
        
        }
    
    }

}

- (void)hq_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture {
    
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        
        HQGestureActionBlock block = objc_getAssociatedObject(self, &q_actionHandlerLongPressBlockKey);
        
        if (block) {
            
            block(gesture);
        
        }
    
    }

}

@end
