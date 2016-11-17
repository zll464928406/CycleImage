# CycleImage

>**简介**

这是一个常用的启动页面的轮播器，显示当前所处的页面，最后一页的时候会显示立即体验的按钮

>**使用介绍**

- 1.将以下文件拖入到项目中
    - CycleView的.h和.m文件
    - CycleCollectionViewCell的.h和.m文件
- 2.在需要添加轮播器的文件中导入头文件
    - #import "CycleView.h"
- 3.添加如下代码
    
    ```
    //添加轮播器
    CycleView *cycleView = [[CycleView alloc] initWithFrame:self.view.bounds];
    //添加轮播器中的图片
    cycleView.imgArray = @[@"page1",@"page2",@"page3",];
    //立即体验按钮的block
    cycleView.jumpButtonClick = ^{
        NSLog(@"点击了立即体验按钮");
        };
    //每张图片点击的block
    cycleView.imageClick = ^(NSInteger num){
        NSLog(@"点击了第%zd张图片",num);
        };
    //将轮播器添加到视图中
    [self.view addSubview:cycleView];
    ```


