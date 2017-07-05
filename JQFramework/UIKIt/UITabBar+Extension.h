//
//  UITabBar+Extension.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/1/17.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Extension)

/**
 creat a badge at the tabbarItem

 @param index index description
 */
- (void)showBadgeOnItmIndex:(int)index;


/**
 hide the badge

 @param index index description
 */
- (void)hideBadgeOnItemIndex:(int)index;

@end
