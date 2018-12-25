//
//  UIButton+JQBlock.m
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/16.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import "UIButton+JQBlock.h"
#import <objc/runtime.h>

static const void *JQ_UIButtonBlockKey = &JQ_UIButtonBlockKey;


@implementation UIButton (JQBlock)

- (void)addActionHandler:(JQTouchedButtonBlock)touchHandler
{
    objc_setAssociatedObject(self, JQ_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(JQ_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)JQ_blockActionTouched:(UIButton *)btn{
    JQTouchedButtonBlock block = objc_getAssociatedObject(self, JQ_UIButtonBlockKey);
    if (block) {
        block(btn);
    }
}

@end

