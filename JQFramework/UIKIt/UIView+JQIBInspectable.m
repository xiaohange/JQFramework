//
//  UIView+JQIBInspectable.m
//  yuyi
//
//  Created by 韩俊强 on 2017/7/5.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "UIView+JQIBInspectable.h"

@implementation UIView (JQIBInspectable)

- (CGFloat)JQRadius
{
    return self.layer.cornerRadius;
}

- (void)setJQRadius:(CGFloat)JQRadius
{
    self.layer.cornerRadius = JQRadius;
    self.clipsToBounds = JQRadius > 0;
}

- (UIColor *)JQBorderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setJQBorderColor:(UIColor *)JQBorderColor
{
    self.layer.borderColor = JQBorderColor.CGColor;
}

- (CGFloat)JQ_LineWidth
{
    return self.layer.borderWidth;
}

- (void)setJQ_LineWidth:(CGFloat)JQ_LineWidth
{
    self.layer.borderWidth = JQ_LineWidth;
}


@end
