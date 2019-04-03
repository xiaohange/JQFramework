//
//  UIView+JQExtern.m
//  LsddHappyProject
//
//  Created by administrator on 2018/4/17.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "UIView+JQExtern.h"

@implementation UIView (JQExtern)

- (CGFloat) x
{
    return self.frame.origin.x ;
}

- (void) setX : (CGFloat) x
{
    CGRect rect = self.frame ;
    rect.origin.x = x ;
    self.frame = rect ;
}

- (CGFloat) y
{
    return  self.frame.origin.y ;
}

- (void) setY : (CGFloat) y
{
    CGRect rect = self.frame ;
    rect.origin.y = y ;
    self.frame = rect ;
}

- (CGFloat) width
{
    return  self.frame.size.width ;
}

- (void) setWidth : (CGFloat) width
{
    CGRect rect = self.frame ;
    rect.size.width = width ;
    self.frame = rect ;
}

- (CGFloat) height
{
    return  self.frame.size.height ;
}

- (void) setHeight : (CGFloat) height
{
    CGRect rect = self.frame ;
    rect.size.height = height ;
    self.frame = rect ;
}


- (CGRect) rect
{
    return  self.frame ;
}

- (void)setRect : (CGRect) rect  {
    
    self.frame = rect ;
}

- (CGSize) size
{
    
    return self.frame.size ;
}

- (void)setSize : (CGSize) size  {
    
    CGRect rect = self.frame ;
    rect.size = size ;
    self.frame = rect ;
    
}

- (CGPoint) origin  {
    
    return self.frame.origin ;
}

- (void) setOrigin : (CGPoint) origin {
    CGRect rect = self.frame ;
    rect.origin = origin ;
    self.frame = rect ;
}


+ (id)viewWithFrame:(CGRect)rect superView:(UIView *)superView
{
    Class class = [self class];
    UIView *view = [[class alloc] initWithFrame:rect];
    [superView addSubview:view];
    return view;
}

+ (id)view
{
    Class class = [self class];
    UIView *view = [[class alloc] initWithFrame:CGRectZero];
    return view;
}

+ (id)viewWithSuperView:(UIView *)superView
{
    Class class = [self class];
    UIView *view = [[class alloc] initWithFrame:CGRectZero];
    [superView addSubview:view];
    return view;
}




- (void)circleHandle:(CGFloat)radius size:(CGSize)size
{
    
    CGRect rect = CGRectZero;
    rect.size = size;
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:rect
                                                  byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                        cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

- (void)alphaAnimateShow
{
    self.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)alphaAnimateHide
{
    self.alpha = 1.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setCornerRadius:(CGFloat)r
{
    self.layer.cornerRadius = r;
    self.layer.masksToBounds = YES;
}

- (void)busiDialogCornerHandle
{
    [self setCornerRadius:10];
}


- (void)shakeAniamteBegin
{
    [self shakeAniamteBeginWithFromValue:-0.05 toValue:0.05];
}

- (void)shakeAniamteBeginWithFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue
{
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue = [NSNumber numberWithFloat:fromValue];
    shake.toValue = [NSNumber numberWithFloat:toValue];
    shake.duration = 0.1;
    shake.autoreverses = YES;
    shake.repeatCount = 2;
    [self.layer addAnimation:shake forKey:@"imageView"];
}

- (void)addTapTarget:(id)target selector:(SEL)selector
{
    if (!target || !selector) {
        return;
    }
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:tap];
}


+ (UIView *)createInputFieldBgView:(CGRect)rect
{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor clearColor];
    view.layer.cornerRadius = 4;
    view.layer.masksToBounds = YES;
    view.layer.borderColor = [UIColor colorWithRed:(0xe0)/255.0f green:(0xe0)/255.0f blue:(0xe0)/255.0f alpha:1].CGColor;
    view.layer.borderWidth = 1.0;
    return view;
}

- (void)setRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (UIImage *)getSnapShotImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *complexViewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return complexViewImage;
}

- (void)addTapEventWithTaget:(id)target selector:(SEL)selector
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:tap];
}

@end
