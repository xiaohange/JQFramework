//
//  UIImage+JQGIF.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/16.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JQGIF)

+ (UIImage *)animatedGIFNamed:(NSString *)name;

+ (UIImage *)animatedGIFWithData:(NSData *)data;

@end
