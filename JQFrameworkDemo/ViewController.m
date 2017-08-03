//
//  ViewController.m
//  JQFrameworkDemo
//
//  Created by 韩俊强 on 2017/5/18.
//  Copyright © 2017年 HaRi. All rights reserved.
//

#import "ViewController.h"
#import "JQFramework.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 60, kScreenWidth, 200) ];
    textView.layer.borderColor = [UIColor redColor].CGColor;
    textView.layer.borderWidth = 0.5;
    textView.placeholder = @"这是一个占位提示！";
    [self.view addSubview:textView];
    
    // init Lbl
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 200)];
    label.text = @"兰亭黑字体";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    // get Path
    NSString *pathToFont = [[NSBundle mainBundle] pathForResource:@"lantinghei" ofType:@"TTF"];
    UIFont *smallFontFromURL = [UIFont fontWithTTFAtURL:[NSURL fileURLWithPath:pathToFont] size:26.0f];
    
    label.font = smallFontFromURL;
    
    
    // gradient color
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(0, 500, 300, 100)];
    testView.backgroundColor = [UIColor gradientFromColor:[UIColor greenColor] toColor:[UIColor clearColor] withHeight:100];
    [self.view addSubview:testView];
    
    // KVO
    [textView JQ_addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        NSLog(@"%@", change);
    }
}

- (void)dealloc
{
    [self JQ_removeObserver:self forKeyPath:@"contentOffset"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
