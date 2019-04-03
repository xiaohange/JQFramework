//
//  NSArray+JQArray.h
//  LsddHappyProject
//
//  Created by administrator on 2018/6/14.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JQArray)

/**
 获取不重复的随机数数组

 @param num 几位
 @return return value description
 */
- (NSArray *)randomArray:(NSInteger)num;
@end
