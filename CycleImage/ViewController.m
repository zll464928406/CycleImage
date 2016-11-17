//
//  ViewController.m
//  CycleImage
//
//  Created by 张令林 on 2016/11/17.
//  Copyright © 2016年 personer. All rights reserved.
//

#import "ViewController.h"
#import "CycleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //调用初始化方法
    [self setUpUI];
}

#pragma mark 初始化方法
- (void)setUpUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    CycleView *cycleView = [[CycleView alloc] initWithFrame:self.view.bounds];
    cycleView.imgArray = @[@"page1",@"page2",@"page3",];
    cycleView.jumpButtonClick = ^{
        NSLog(@"点击了立即体验按钮");
    };
    cycleView.imageClick = ^(NSInteger num){
        NSLog(@"点击了第%zd张图片",num);
    };
    [self.view addSubview:cycleView];
    
}


@end
