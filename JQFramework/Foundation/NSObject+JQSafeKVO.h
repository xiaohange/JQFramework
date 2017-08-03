//
//  NSObject+JQSafeKVO.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/8/3.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

/**
 Fix KVO's crash. You just [NSObject removeObserver:forKeyPath:context] and
 do not need removeObserver. This implementation will auto remove observer
 when observer or observered object dealloc.
 
 KVO crash in three situations:
 1. The time of calling [NSObject removeObserver:forKeyPath:context] 
    more than [NSObject addObserver:forKeyPath:context].
 2. Forget to call [NSObject removeObserver:forKeyPath:context]
    when observer or observered object dealloc and you called
    [NSObject addObserver:forKeyPath:options:context:].
 **/

#import <Foundation/Foundation.h>

@interface NSObject (JQSafeKVO)

- (void)JQ_addObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void *)context;

- (void)JQ_removeObserver:(NSObject *)observer
               forKeyPath:(NSString *)keyPath
                  context:(void *)context;

- (void)JQ_removeObserver:(NSObject *)observer
               forKeyPath:(NSString *)keyPath;

@end
