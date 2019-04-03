//
//  NSObject+JQAdd.m
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/17.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import "NSObject+JQAdd.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@implementation NSObject (JQAdd)

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

- (void)setAssociateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAssociateWeakValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)removeAssociatedValues {
    objc_removeAssociatedObjects(self);
}

- (id)getAssociatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

+ (NSString *)className {
    return NSStringFromClass(self);
}

- (NSString *)className {
    return [NSString stringWithUTF8String:class_getName([self class])];
}


+ (id)object
{
    return [[[self class] alloc] init];
}

+ (id)objectWithDictionary:(NSDictionary *)dictionay
{
    if (!dictionay) {
        return nil;
    }
    return [[self alloc] initWithDictionary:dictionay];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionay
{
    return nil ;
}

- (id)initWithDictionary:(NSDictionary *)dictionay
{
    return [self init];
}

- (BOOL)isDictionaryClass
{
    return [self isKindOfClass:[NSDictionary class]];
}

- (BOOL)isArrayClass
{
    return [self isKindOfClass:[NSArray class]];
}

- (BOOL)isObjectValid
{
    return YES;
}

+ (NSArray *)objectListWithDictionaryList:(NSArray *)dictList
{
    if (!dictList.count) {
        return nil;
    }
    NSMutableArray *objectList = [NSMutableArray arrayWithCapacity:dictList.count];
    [dictList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *dict = (NSDictionary *)obj;
        id item = [[self class] objectWithDictionary:dict];
        if (item && [item isObjectValid]) {
            [objectList addObject:item];
        }
    }];
    return objectList;
}

+ (NSArray *)modelListWithDictionaryList:(NSArray *)dictList
{
    if (!dictList.count) {
        return nil;
    }
    NSMutableArray *objectList = [NSMutableArray arrayWithCapacity:dictList.count];
    [dictList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *dict = (NSDictionary *)obj;
        id item = [[self class] modelWithDictionary:dict];
        if (item && [item isObjectValid]) {
            [objectList addObject:item];
        }
    }];
    return objectList;
}


- (NSInvocation *)createInvocationWithSelector:(SEL)selector
{
    if (!selector) {
        return nil;
    }
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:self];
    [invocation setSelector:selector];
    return invocation;
}

- (void)performBlock:(void(^)(void))block afterDelay:(NSTimeInterval)delayInSecond
{
    dispatch_queue_t dispatchQueue = dispatch_get_main_queue();
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSecond * NSEC_PER_SEC));
    dispatch_after(popTime, dispatchQueue, ^(void){
        block();
    });
    
}


@end
