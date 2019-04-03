//
//  UIButton+JQExtern.m
//  LsddHappyProject
//
//  Created by administrator on 2018/4/17.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "UIButton+JQExtern.h"

@implementation UIButton (JQExtern)

- (void)setTitleFont:(UIFont *)font
{
    self.titleLabel.font = font;
}

- (void)setTitleFontSize:(CGFloat)size
{
    self.titleLabel.font = [UIFont systemFontOfSize:size];
}

- (void)setNormalTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setNormalImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setNormalImageName:(NSString *)imageName
{
    if ([self isNotBlank:imageName]) {
        [self setNormalImage:[UIImage imageNamed:imageName]];
    }
}

- (void)setHighImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateHighlighted];
}

- (void)setHighImageName:(NSString *)imageName
{
    if ([self isNotBlank:imageName]) {
        [self setHighImage:[UIImage imageNamed:imageName]];
    }
}

- (void)setNormalBgImage:(UIImage *)image
{
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)setNormalBgImageName:(NSString *)imageName
{
    if ([self isNotBlank:imageName]) {
        [self setNormalBgImage:[UIImage imageNamed:imageName]];
    }
}

- (void)setHighBgImage:(UIImage *)image
{
    [self setBackgroundImage:image forState:UIControlStateHighlighted];
}

- (void)setHighBgImageName:(NSString *)imageName
{
    if ([self isNotBlank:imageName]) {
        [self setHighBgImage:[UIImage imageNamed:imageName]];
    }
}

- (void)setSelBgImage:(UIImage *)image
{
    [self setBackgroundImage:image forState:UIControlStateSelected];
}

- (void)setSelImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateSelected];
}

- (void)setSelBgImageName:(NSString *)imageName
{
    if ([self isNotBlank:imageName]) {
        [self setSelBgImage:[UIImage imageNamed:imageName]];
    }
}

- (void)setSelImageName:(NSString *)imageName
{
    if ([self isNotBlank:imageName]) {
        [self setSelImage:[UIImage imageNamed:imageName]];
    }
}

-(BOOL)isNotBlank:(NSString *)str{
    
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < str.length; ++i) {
        unichar c = [str characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (void)addTouchUpInsideEventWithTarget:(id)target selector:(SEL)selector
{
    [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

- (void)setButtonShowType:(JQButtonTextType)type
{
    [self layoutIfNeeded];
    
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
    
    CGFloat space = titleFrame.origin.x - imageFrame.origin.x - imageFrame.size.width + 9;
    
    switch (type) {
        case JQButtonTypeRight:
        {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0,imageFrame.size.width - space, 0, -(imageFrame.size.width - space))];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, -(titleFrame.origin.x - imageFrame.origin.x), 0, imageFrame.origin.x - titleFrame.origin.x)];
        }
            break;
        case JQButtonTypeLeft:
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,titleFrame.size.width + space, 0, -(titleFrame.size.width + space))];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(titleFrame.origin.x - imageFrame.origin.x), 0, titleFrame.origin.x - imageFrame.origin.x)];
        }
            break;
        case JQButtonTypeBottom:
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,0, titleFrame.size.height + space, -(titleFrame.size.width))];
            
            [self setTitleEdgeInsets:UIEdgeInsetsMake(imageFrame.size.height + space, -(imageFrame.size.width), 0, 0)];
        }
            break;
        case JQButtonTypeTop:
        {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0,-(imageFrame.size.width), imageFrame.size.height + space, 0)];
            
            [self setImageEdgeInsets:UIEdgeInsetsMake(titleFrame.size.height + space,(titleFrame.size.width), 0, 0)];
        }
            break;
        default:
            break;
    }
    
}

@end
