//
//  UIControl+JQ.m
//  JQButtonRepeatClick
//
//  Created by 韩俊强 on 2016/12/20.
//  Copyright © 2016年 HaRi. All rights reserved.
//

#import "UIControl+JQ.h"
#import <objc/runtime.h>

@implementation UIControl (JQ)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

static const char *UIControl_ingoreEvent = "UIControl_ingoreEvent";

- (NSTimeInterval)JQ_acceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval)doubleValue];
}

- (void)setJQ_acceptEventInterval:(NSTimeInterval)JQ_acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval,@(JQ_acceptEventInterval),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)JQ_ignoreEvent
{
    return [objc_getAssociatedObject(self, UIControl_ingoreEvent)boolValue];
}

- (void)setJQ_ignoreEvent:(BOOL)JQ_ignoreEvent
{
    objc_setAssociatedObject(self, UIControl_ingoreEvent, @(JQ_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load
{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__JQ_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)__JQ_sendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event
{
    if (self.JQ_ignoreEvent)return;
    if (self.JQ_acceptEventInterval > 0) {
        self.JQ_ignoreEvent = YES;
        [self performSelector:@selector(setJQ_ignoreEvent:) withObject:@(NO) afterDelay:self.JQ_acceptEventInterval];
    }
    [self __JQ_sendAction:action to:target forEvent:event];
}

@end
