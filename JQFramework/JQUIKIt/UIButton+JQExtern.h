//
//  UIButton+JQExtern.h
//  LsddHappyProject
//
//  Created by administrator on 2018/4/17.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, JQButtonTextType) {
    JQButtonTypeRight = 0, //文字图片在右测
    JQButtonTypeLeft, //文字图片在左测
    JQButtonTypeBottom, //文字图片在下测
    JQButtonTypeTop //文字图片在上测
};

@interface UIButton (JQExtern)
- (void)setTitleFont:(UIFont *)font;
- (void)setTitleFontSize:(CGFloat)size;
- (void)setNormalImage:(UIImage *)image;
- (void)setNormalImageName:(NSString *)imageName;
- (void)setHighImage:(UIImage *)image;
- (void)setHighImageName:(NSString *)imageName;
- (void)setNormalBgImage:(UIImage *)image;
- (void)setNormalBgImageName:(NSString *)imageName;
- (void)setHighBgImage:(UIImage *)image;
- (void)setHighBgImageName:(NSString *)imageName;
- (void)setSelBgImage:(UIImage *)image;
- (void)setSelBgImageName:(NSString *)imageName;
- (void)setSelImageName:(NSString *)imageName;
- (void)setSelImage:(UIImage *)image;
- (void)addTouchUpInsideEventWithTarget:(id)target selector:(SEL)selector;
- (void)setButtonShowType:(JQButtonTextType)type;
@end
