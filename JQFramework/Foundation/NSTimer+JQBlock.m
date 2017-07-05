//
//  NSTimer+JQBlock.m
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/17.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import "NSTimer+JQBlock.h"

typedef BOOL (^NSTimerWrapBlockType)();

@implementation NSTimer (JQBlock)

+ (void)_JQ_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)JQ_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(_JQ_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)JQ_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(_JQ_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

#pragma mark ------ 以下是新增方法 ------

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                              target:(id)target
                             repeats:(BOOL)inRepeats
                               block:(void (^)(NSTimer *timer))inBlock {
    
    __weak typeof(target) weakTarget = target;
    NSTimerWrapBlockType wrapBlock = ^(NSTimer *timer) {
        if (!weakTarget) {
            return NO;
        }
        
        inBlock(timer);
        return YES;
    };
    
    return [self scheduledTimerWithTimeInterval:inTimeInterval
                                         target:self
                                       selector:@selector(handleTimeout:)
                                       userInfo:wrapBlock
                                        repeats:inRepeats];
}

+ (id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                     target:(id)target
                    repeats:(BOOL)inRepeats
                      block:(void (^)(NSTimer *timer))inBlock {
    
    __weak typeof(target) weakTarget = target;
    NSTimerWrapBlockType wrapBlock = ^(NSTimer *timer) {
        if (!weakTarget) {
            return NO;
        }
        
        inBlock(timer);
        return YES;
    };
    
    return [self timerWithTimeInterval:inTimeInterval
                                target:self
                              selector:@selector(handleTimeout:)
                              userInfo:wrapBlock
                               repeats:inRepeats];
}

+ (void)handleTimeout:(NSTimer *)inTimer {
    
    if (inTimer.userInfo) {
        NSTimerWrapBlockType wrapBlock = inTimer.userInfo;
        if (!wrapBlock(inTimer)) {
            [inTimer invalidate];
        }
    }
}

@end
