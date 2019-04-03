//
//  NSString+JQAdd.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/17.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JQAdd)

/**
 *  是否包含字符串
 *
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)containsString:(NSString *)string;

/**
 *  去除首尾空格
 *
 *  @return <#return value description#>
 */
- (NSString *)removeWhiteSpacesFromString;

/**
 *  是否为空  nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
 *
 *  @return <#return value description#>
 */
-(BOOL)isNotBlank;
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
 *  验证是否为邮箱
 *
 *  @return <#return value description#>
 */
- (BOOL)isValidEmail;
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
 *  字符串替换
 *
 *  @param olderChar <#olderChar description#>
 *  @param newerChar <#newerChar description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
/**
 *  头像URl
 *
 *  @return <#return value description#>
 */
-(NSString* )headImageUrl;

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



#pragma mark ----- 时间戳
/*
 *  时间戳对应的NSDate
 */
@property (nonatomic,strong,readonly) NSDate *date;

/**
 *  时间戳转格式化的时间字符串
 */
-(NSString *)timestampToTimeStringWithFormatString:(NSString *)formatString;

/**
 *  获取周几
 *
 *  @return <#return value description#>
 */
- (NSString *)timeStampToWeekDay;


#pragma mark ----- 路径
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

/**
 将某个时间 转化成 时间戳

 @param format 例如：yyyy-MM-dd HH:mm:ss
 @return 时间戳
 */
- (NSInteger)standardTimeStampAndFormatter:(NSString *)format;

/**
 将某个时间戳 转化成 时间

 @param format 例如：yyyy-MM-dd HH:mm:ss
 @return 时间
 */
- (NSString *)timestampToStandardTimeAndFormatter:(NSString *)format;

- (BOOL)isEqualToStringCaseInsensitive:(NSString *)aString;
@end
