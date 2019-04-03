//
//  UILabel+JQExtern.h
//  LsddHappyProject
//
//  Created by administrator on 2018/4/17.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JQExtern)

+ (UILabel *)labelWithFrame:(CGRect)rect
                       text:(NSString *)text
                       font:(UIFont *)font
                  superView:(UIView *)superView;

+ (UILabel *)labelWithFrame:(CGRect)rect
                       text:(NSString *)text
                   fontSize:(CGFloat)fontSize
                  superView:(UIView *)superView;

+ (UILabel *)labelWithFrame:(CGRect)rect
                       text:(NSString *)text
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment
                  superView:(UIView *)superView;

+ (UILabel *)labelWithFrame:(CGRect)rect
                       text:(NSString *)text
                   fontSize:(CGFloat)fontSize
              textAlignment:(NSTextAlignment)textAlignment
                  superView:(UIView *)superView;

+ (UILabel *)labelWithFrame:(CGRect)rect
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment
                  superView:(UIView *)superView;

+ (UILabel *)labelWithFrame:(CGRect)rect
                   fontSize:(CGFloat)fontSize
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment
                  superView:(UIView *)superView;

@end
