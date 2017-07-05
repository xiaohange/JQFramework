//
//  UITabBar+Extension.m
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/1/17.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "UITabBar+Extension.h"
#define TabbarItemNums 5.0

@implementation UITabBar (Extension)

- (void)showBadgeOnItmIndex:(int)index
{
    [self removeBadgeOnItemIndex:index];
    //create
    UIImageView *bview = [[UIImageView alloc]init];
    bview.tag = 888+index;
    bview.layer.cornerRadius = 10;
    bview.clipsToBounds = YES;
    bview.backgroundColor = [UIColor redColor];
//    [bview setImage:[UIImage imageNamed:@"love"]];
    CGRect tabFram = self.frame;
    
    float percentX = (index+0.6)/TabbarItemNums;
    CGFloat x = ceilf(percentX*tabFram.size.width+20);
    CGFloat y = ceilf(0.1*tabFram.size.height);
    bview.frame = CGRectMake(x, y, 20, 20);
    [self addSubview:bview];
    [self bringSubviewToFront:bview];
}

-(void)hideBadgeOnItemIndex:(int)index{
    [self removeBadgeOnItemIndex:index];
}

- (void)removeBadgeOnItemIndex:(int)index{
    for (UIView*subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
