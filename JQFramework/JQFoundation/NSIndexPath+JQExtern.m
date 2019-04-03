//
//  NSIndexPath+JQExtern.m
//  LsddHappyProject
//
//  Created by administrator on 2018/4/17.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "NSIndexPath+JQExtern.h"

@implementation NSIndexPath (JQExtern)

- (BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath) {
        return NO;
    }
    if ([self compare:indexPath] == NSOrderedSame) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isSmallThanIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath) {
        return NO;
    }
    if ([self compare:indexPath] == NSOrderedAscending) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isBiggerThanIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath) {
        return YES;
    }
    if ([self compare:indexPath] == NSOrderedDescending) {
        return YES;
    } else {
        return NO;
    }
}

@end
