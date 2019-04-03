//
//  UIButton+NoWebCache.m
//  LsddHappyProject
//
//  Created by administrator on 2018/5/18.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "UIButton+NoWebCache.h"

@implementation UIButton (NoWebCache)

- (void)nwc_setButtonBgImageWithUrl:(NSString *)urlStr{
    
    NSURL * url = [NSURL URLWithString:urlStr];
    dispatch_queue_t xrQueue = dispatch_queue_create("loadImage", NULL);
    
    dispatch_async(xrQueue, ^{
        UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setBackgroundImage:img forState:UIControlStateNormal];
        });
    });
}
@end
