//
//  NSIndexPath+JQExtern.h
//  LsddHappyProject
//
//  Created by administrator on 2018/4/17.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (JQExtern)

- (BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath;
- (BOOL)isSmallThanIndexPath:(NSIndexPath *)indexPath;
- (BOOL)isBiggerThanIndexPath:(NSIndexPath *)indexPath;

@end
