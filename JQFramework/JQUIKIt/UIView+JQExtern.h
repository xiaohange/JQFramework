//
//  UIView+JQExtern.h
//  LsddHappyProject
//
//  Created by administrator on 2018/4/17.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JQExtern)
- (CGFloat) x ;
- (void) setX : (CGFloat) x ;

- (CGFloat) y ;

- (void) setY : (CGFloat) y ;

- (CGFloat) width ;

- (void) setWidth : (CGFloat) width ;

- (CGFloat) height ;

- (void) setHeight : (CGFloat) height ;

- (CGRect) rect ;

- (void)setRect : (CGRect) rect ;

- (CGSize) size ;

- (void)setSize : (CGSize) size ;

- (CGPoint) origin ;

- (void) setOrigin : (CGPoint) origin ;


+ (id)viewWithFrame:(CGRect)rect superView:(UIView *)superView;
+ (id)view;
+ (id)viewWithSuperView:(UIView *)superView;



- (void)addTapTarget:(id)target selector:(SEL)selector;

- (void)circleHandle:(CGFloat)radius size:(CGSize)size;


- (void)alphaAnimateShow;
- (void)alphaAnimateHide;

- (void)setCornerRadius:(CGFloat)r;

+ (UIView *)createInputFieldBgView:(CGRect)rect;

- (void)shakeAniamteBegin;

- (void)setRadius:(CGFloat)radius;
- (UIImage *)getSnapShotImage;

- (void)addTapEventWithTaget:(id)target selector:(SEL)selector;

@end
