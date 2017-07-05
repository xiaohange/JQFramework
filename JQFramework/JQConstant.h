//
//  JQConstant.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/21.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#ifndef JQConstant_h
#define JQConstant_h

#import "JQUtilities.h"

static const CGFloat JQStatusBarHeight = 20;
static const CGFloat JQNavigationBarHeight = 44;
static const CGFloat JQStatusAndNavigationHeight = (JQStatusBarHeight + JQNavigationBarHeight);
static const CGFloat JQTabbarHeight = 49;



#pragma mark --- device

#ifndef kIsIphone4
#define kIsIphone4 (kScreenHeight == 480)
#endif

#ifndef kIsIphone5
#define kIsIphone5 (kScreenHeight == 568)
#endif

#ifndef kIsIphone6
#define kIsIphone6 (kScreenHeight == 667)
#endif

#ifndef kIsIphone6P
#define kIsIphone6P (kScreenHeight == 736)
#endif



#pragma mark --- systemVersion

#ifndef kSystemVersion
#define kSystemVersion [UIDevice systemVersion]
#endif

#ifndef kiOS6Later
#define kiOS6Later (kSystemVersion >= 6)
#endif

#ifndef kiOS7Later
#define kiOS7Later (kSystemVersion >= 7)
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif

#ifndef kiOS10Later
#define kiOS10Later (kSystemVersion >= 10)
#endif


#pragma mark --- Others
//1px 
#ifndef SINGLE_LINE_HEIGHT
#define SINGLE_LINE_HEIGHT (1/JQScreenScale())
#endif


//debug
#ifdef DEBUG //develop
#define NSLog(...) NSLog(@"%s %d\n %@\n\n", __func__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else //release
#define NSLog(...)
#endif


//block
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };



#endif /* JQConstant_h */
