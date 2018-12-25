//
//  CALayer+JQIBInspectable.m
//  BellSjlsProject
//
//  Created by administrator on 2018/4/19.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "CALayer+JQIBInspectable.h"

@implementation CALayer (JQIBInspectable)
- (void)setShadowUIColor:(UIColor*)color
{
    self.shadowColor = color.CGColor;
}

- (UIColor *)shadowUIColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}
@end
