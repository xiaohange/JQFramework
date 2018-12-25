//
//  UIButton+JQBlock.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/16.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JQTouchedButtonBlock)(UIButton *sender);

@interface UIButton (JQBlock)

- (void)addActionHandler:(JQTouchedButtonBlock)touchHandler;

@end
