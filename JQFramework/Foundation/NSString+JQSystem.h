//
//  NSString+JQSystem.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/15.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JQSystem)

/**
 *  获取app  Version
 *
 *  @return <#return value description#>
 */
+ (NSString *)getMyApplicationVersion;
/**
 *  获取app  名称
 *
 *  @return <#return value description#>
 */
+ (NSString *)getMyApplicationName;

/**
 *  获取app  Target名称
 *
 *  @return <#return value description#>
 */
+ (NSString *)getMyApplicationTargetName;

/**
 *  application  documents路径
 *
 *  @return <#return value description#>
 */
+ (NSString *)documentsPath;

/**
 *  application  cache 路径
 *
 *  @return <#return value description#>
 */
+ (NSString *)cachesPath;


/**
 *  application library 路径
 *
 *  @return <#return value description#>
 */
+ (NSString *)libraryPath;


@end
