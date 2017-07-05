//
//  JQUtilities.m
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/21.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JQUtilities.h"

CGFloat JQScreenScale() {
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}

CGSize JQScreenSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}
