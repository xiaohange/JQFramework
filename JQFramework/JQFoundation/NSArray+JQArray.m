//
//  NSArray+JQArray.m
//  LsddHappyProject
//
//  Created by administrator on 2018/6/14.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "NSArray+JQArray.h"

@implementation NSArray (JQArray)

- (NSArray *)randomArray:(NSInteger)num
{
    //初始化元数据
    NSMutableArray *startArray = [NSMutableArray arrayWithArray:self];
    //随机产生结果
    NSMutableArray *resultArray = [NSMutableArray array];
    //随机个数
    NSInteger m = num;
    for (int i = 0; i < m; i++) {
        int t = arc4random() % startArray.count;
        resultArray[i] = startArray[t];
        startArray[t] = [startArray lastObject];//为了更好的乱序, 交换位置
        [startArray removeLastObject];
    }
    return resultArray;
}

@end
