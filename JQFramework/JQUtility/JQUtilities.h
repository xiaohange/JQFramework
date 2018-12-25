//
//  JQUtilities.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/21.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#ifndef JQUtilities_h
#define JQUtilities_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


/// Get main screen's scale.
CGFloat JQScreenScale();

/// Get main screen's size. Height is always larger than width.
CGSize JQScreenSize();


// main screen's scale
#ifndef kScreenScale
#define kScreenScale JQScreenScale()
#endif

// main screen's size (portrait)
#ifndef kScreenSize
#define kScreenSize JQScreenSize()
#endif

// main screen's width (portrait)
#ifndef kScreenWidth
#define kScreenWidth JQScreenSize().width
#endif

// main screen's height (portrait)
#ifndef kScreenHeight
#define kScreenHeight JQScreenSize().height
#endif



#endif /* JQUtilities_h */
