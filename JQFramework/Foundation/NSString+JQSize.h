//
//  NSString+JQSize.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/15.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (JQSize)

/**
 *  文字占用Size
 *
 *  @param font          <#font description#>
 *  @param size          <#size description#>
 *  @param lineBreakMode <#lineBreakMode description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;
/**
 *  文字占用宽度
 *
 *  @param font <#font description#>
 *
 *  @return <#return value description#>
 */
- (CGFloat)widthForFont:(UIFont *)font;

/**
 *  文字占用高度
 *
 *  @param font  <#font description#>
 *  @param width <#width description#>
 *
 *  @return <#return value description#>
 */
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;


/**
 *  @brief  反转字符串
 *
 *  @param strSrc 被反转字符串
 *
 *  @return 反转后字符串
 */
+ (NSString *)reverseString:(NSString *)strSrc;



@end
