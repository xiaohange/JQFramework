//
//  NSUserDefaults+JQSafeAccess.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/17.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (JQSafeAccess)

+ (NSString *)JQ_stringForKey:(NSString *)defaultName;

+ (NSArray *)JQ_arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)JQ_dictionaryForKey:(NSString *)defaultName;

+ (NSData *)JQ_dataForKey:(NSString *)defaultName;

+ (NSArray *)JQ_stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)JQ_integerForKey:(NSString *)defaultName;

+ (float)JQ_floatForKey:(NSString *)defaultName;

+ (double)JQ_doubleForKey:(NSString *)defaultName;

+ (BOOL)JQ_boolForKey:(NSString *)defaultName;

+ (NSURL *)JQ_URLForKey:(NSString *)defaultName;

#pragma mark - WRITE FOR STANDARD

+ (void)JQ_setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - READ ARCHIVE FOR STANDARD

+ (id)JQ_arcObjectForKey:(NSString *)defaultName;

#pragma mark - WRITE ARCHIVE FOR STANDARD

+ (void)JQ_setArcObject:(id)value forKey:(NSString *)defaultName;

@end
