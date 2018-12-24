//
//  NSString+MD5.h
//  xizhi
//
//  Created by Sky on 16/7/3.
//  Copyright © 2016年 xizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

+(NSString* )convertToMD5:(NSString* )conStr;


/**
 *  SHA1 加密
 *
 *  @return <#return value description#>
 */
- (NSString *)sha1;
@end
