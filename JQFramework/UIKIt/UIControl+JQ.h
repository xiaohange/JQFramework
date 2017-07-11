//
//  UIControl+JQ.h
//  JQButtonRepeatClick
//
//  Created by 韩俊强 on 2016/12/20.
//  Copyright © 2016年 HaRi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (JQ)

// 设置几秒内忽略重复点击
@property (nonatomic, assign) NSTimeInterval JQ_acceptEventInterval; // 点击事件时间间隔

@property (nonatomic, assign) BOOL JQ_ignoreEvent;                   // 是否忽略点击事件

@end
