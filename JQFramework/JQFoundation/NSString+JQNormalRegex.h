//
//  NSString+JQNormalRegex.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/15.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JQNormalRegex)

/**
 *  验证是否为邮箱
 *
 *  @return <#return value description#>
 */
- (BOOL)isValidEmail;

/**
 是否纯数字
 
 @return <#return value description#>
 */
- (BOOL)isVAlidNumbers;

/**
 *  验证是否为电话
 *
 *  @return <#return value description#>
 */
- (BOOL)isVAlidPhoneNumber;
/**
 *  验证是否为URL
 *
 *  @return <#return value description#>
 */
- (BOOL)isValidUrl;
/**
 *  是否为中文
 *
 *  @return <#return value description#>
 */
- (BOOL)isChinese;


/**
 简单的身份证号码有效性

 @return <#return value description#>
 */
- (BOOL)isValidSimpleVerifyIdentifyCardNum;


/**
 精确检测身份证号码有效性

 @param value <#value description#>
 @return <#return value description#>
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

@end
