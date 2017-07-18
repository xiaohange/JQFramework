//
//  UIImage+JQColor.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/16.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JQColor)

/**
 Create and return a 1x1 point size image with the given color.
 
 @param color  The color. 根据颜色生成纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 Create and return a pure color image with the given color and size.
 
 @param color  The color.
 @param size   New image's type.
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;



/**
  Get the color at the pooint 取图片某一像素的颜色

 @param point point description
 @return return value description
 */
- (UIColor *)colorAtPoint:(CGPoint )point;


/**
 Get the Gray image 获得灰度图
 
 @param originImage originImage description
 @return return value description
 */
+ (UIImage *)covertToGrayImageFromOriginImage:(UIImage *)originImage;


/**
 Whether this image has alpha channel.
 */
- (BOOL)hasAlphaChannel;

@end
