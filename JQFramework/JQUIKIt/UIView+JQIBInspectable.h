//
//  UIView+JQIBInspectable.h
//  yuyi
//
//  Created by 韩俊强 on 2017/7/5.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JQIBInspectable)

@property (nonatomic, assign) IBInspectable CGFloat JQRadius;

@property (nonatomic, strong) IBInspectable UIColor *JQBorderColor;

@property (nonatomic, assign) IBInspectable CGFloat JQ_LineWidth;

@end
