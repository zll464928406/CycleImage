//
//  CycleView.m
//  CycleImage
//
//  Created by 张令林 on 2016/11/17.
//  Copyright © 2016年 personer. All rights reserved.
//

#import "CycleView.h"
#import "CycleCollectionViewCell.h"

static NSString *cellid = @"cellid";

@interface CycleView () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,weak) UIPageControl *pageControl;
@property (nonatomic,weak) UIButton *jumpButton;



@end

@implementation CycleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    //添加UICollectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    [self addSubview:collectionView];
    //设置数据源
    collectionView.delegate = self;
    collectionView.dataSource = self;
    //设置属性
    collectionView.bounces = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    self.collectionView = collectionView;
    [collectionView registerClass:[CycleCollectionViewCell class] forCellWithReuseIdentifier:cellid];
    
    //添加分页
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-50, self.bounds.size.width, 20)];
    pageControl.numberOfPages = self.imgArray.count;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
    
    //添加最后的立即体验跳过按钮
    UIButton *jumpButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width*0.5-75, self.bounds.size.height-60, 150, 30)];
    [jumpButton setImage:[UIImage imageNamed:@"jumpButton"] forState:UIControlStateNormal];
    jumpButton.alpha = 0;
    [self addSubview:jumpButton];
    self.jumpButton = jumpButton;
    [jumpButton addTarget:self action:@selector(jumpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imgArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    cell.imageName = self.imgArray[indexPath.row];

    return cell;
}

#pragma mark - 代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.imageClick(indexPath.row);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetX = scrollView.contentOffset.x;
    CGFloat countOffSet = offSetX/self.bounds.size.width;
    self.pageControl.currentPage = (NSInteger)((countOffSet/0.5 + 1)/2);
    if (self.pageControl.currentPage+1 == self.imgArray.count)
    {
        self.pageControl.alpha = 0;
        self.jumpButton.alpha = 1;
    }else
    {
        self.pageControl.alpha = 1;
        self.jumpButton.alpha = 0;
    }
    
    
}

#pragma mark - 设置数组的时候设置一些元素
-(void)setImgArray:(NSArray *)imgArray
{
    _imgArray = imgArray;
    self.pageControl.numberOfPages = self.imgArray.count;
}

#pragma mark - 按钮点击的方法
- (void)jumpButtonClick:(UIButton *)sender
{
    self.jumpButtonClick();
}
@end
