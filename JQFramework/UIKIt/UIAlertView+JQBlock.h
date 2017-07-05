//
//  UIAlertView+JQBlock.h
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/3/16.
//  Copyright © 2017年 韩俊强. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UIAlertViewJQCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertView (JQBlock)<UIAlertViewDelegate>

@property (nonatomic, copy) UIAlertViewJQCallBackBlock JQ_alertViewCallBackBlock;


+ (void)alertWithCallBackBlock:(UIAlertViewJQCallBackBlock)alertViewCallBackBlock
                            title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName
                otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end
