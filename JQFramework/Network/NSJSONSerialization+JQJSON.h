//
//  NSJSONSerialization+JQJSON.h
//  JQBaseRequest
//
//  Created by 韩俊强 on 17/5/22.
//  Copyright © 2017年 韩俊强. All rights reserved.
//  解析json
//  json之间的转换

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (JQJSON)
//json转字符串
+ (nullable NSString *)stringWithJSONObject:(nonnull id)JSONObject;
//字符串转json
+ (nullable id)objectWithJSONString:(nonnull NSString *)JSONString;
//nsdata 转json
+ (nullable id)objectWithJSONData:(nonnull NSData *)JSONData;
@end
