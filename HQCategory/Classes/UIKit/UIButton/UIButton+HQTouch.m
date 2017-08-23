//
//  UIButton+HQTouch.m
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "UIButton+HQTouch.h"
#import <objc/runtime.h>

#define defaultInterval 0.4f

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

@interface UIButton()

/**bool 类型 YES 不允许点击   NO 允许点击   设置是否执行点UI方法*/
@property (nonatomic, assign) BOOL isIgnoreEvent;

@end

@implementation UIButton (HQTouch)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL selA = @selector(sendAction:to:forEvent:);
        SEL selB = @selector(mySendAction:to:forEvent:);
        
        Method methodA =   class_getInstanceMethod(self,selA);
        Method methodB = class_getInstanceMethod(self, selB);
        
        //将 methodB的实现 添加到系统方法中 也就是说 将 methodA方法指针添加成 方法methodB的  返回值表示是否添加成功
        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
        
        //添加成功了 说明 本类中不存在methodB 所以此时必须将方法b的实现指针换成方法A的，否则 b方法将没有实现。
        if (isAdd) {
            
            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
        
        } else {
            
            //添加失败了 说明本类中 有methodB的实现，此时只需要将 methodA和methodB的IMP互换一下即可。
            method_exchangeImplementations(methodA, methodB);
            
        }
    });
    
}

- (NSTimeInterval)timeInterval{
    
    return [objc_getAssociatedObject(self, _cmd) doubleValue];

}

- (void)setTimeInterval:(NSTimeInterval)timeInterval{

    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

//当我们按钮点击事件 sendAction 时  将会执行  mySendAction
- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.isIgnore) {
        
        //不需要被hook
        [self mySendAction:action to:target forEvent:event];
        return;
        
    }
    
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        
        self.timeInterval =self.timeInterval == 0 ? defaultInterval : self.timeInterval;
        
        if (self.isIgnoreEvent){
        
            return;
        
        } else if (self.timeInterval > 0) {
            
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
        
        }
    
    }
    
    //此处 methodA和methodB方法IMP互换了，实际上执行 sendAction；所以不会死循环
    self.isIgnoreEvent = YES;
    [self mySendAction:action to:target forEvent:event];

}

//runtime 动态绑定 属性
- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent{
    
    // 注意BOOL类型 需要用OBJC_ASSOCIATION_RETAIN_NONATOMIC 不要用错，否则set方法会赋值出错
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (BOOL)isIgnoreEvent {
    
    //_cmd == @select(isIgnore); 和set方法里一致
    return [objc_getAssociatedObject(self, _cmd) boolValue];

}

- (void)setIsIgnore:(BOOL)isIgnore {

    // 注意BOOL类型 需要用OBJC_ASSOCIATION_RETAIN_NONATOMIC 不要用错，否则set方法会赋值出错
    objc_setAssociatedObject(self, @selector(isIgnore), @(isIgnore), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (BOOL)isIgnore {

    //_cmd == @select(isIgnore); 和set方法里一致
    return [objc_getAssociatedObject(self, _cmd) boolValue];

}

- (void)resetState {
    
    [self setIsIgnoreEvent:NO];

}

#pragma mark - 点击区域

/**
 扩大UIButton的点击区域
 
 @param edge 四周扩大区域
 */
- (void)hq_addTouchZoneWithEdge:(CGFloat)edge {

    [self hq_addTouchZoneWithTop:edge right:edge bottom:edge left:edge];
    
}

- (void)hq_addTouchZoneWithWith:(CGFloat)with height:(CGFloat)height {

    [self hq_addTouchZoneWithTop:height right:with bottom:height left:with];
    
}

- (void)hq_addTouchZoneWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);

}

- (CGRect)enlargedRect {
    
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        
        return self.bounds;
    
    }

}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event {
    
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        
        return [super hitTest:point withEvent:event];

    }
    
    return CGRectContainsPoint(rect, point) ? self : nil;

}

@end
