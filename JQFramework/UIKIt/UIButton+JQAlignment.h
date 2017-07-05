//
//  UIButton+JQAlignment.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/16.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JQAlignment)

//上下居中，图片在上，文字在下
- (void)JQ_verticalCenterImageAndTitle:(CGFloat)spacing;
- (void)JQ_verticalCenterImageAndTitle; //默认6.0

//左右居中，文字在左，图片在右
- (void)JQ_horizontalCenterTitleAndImage:(CGFloat)spacing;
- (void)JQ_horizontalCenterTitleAndImage; //默认6.0

//左右居中，图片在左，文字在右
- (void)JQ_horizontalCenterImageAndTitle:(CGFloat)spacing;
- (void)JQ_horizontalCenterImageAndTitle; //默认6.0

//文字居中，图片在左边
- (void)JQ_horizontalCenterTitleAndImageLeft:(CGFloat)spacing;
- (void)JQ_horizontalCenterTitleAndImageLeft; //默认6.0

//文字居中，图片在右边
- (void)JQ_horizontalCenterTitleAndImageRight:(CGFloat)spacing;
- (void)JQ_horizontalCenterTitleAndImageRight; //默认6.0


@end
