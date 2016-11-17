//
//  CycleCollectionViewCell.m
//  CycleImage
//
//  Created by 张令林 on 2016/11/17.
//  Copyright © 2016年 personer. All rights reserved.
//

#import "CycleCollectionViewCell.h"

@interface CycleCollectionViewCell ()

@property (nonatomic,weak) UIImageView *imageView;

@end

@implementation CycleCollectionViewCell

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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
}
#pragma mark - 重写set方法设置图片
-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:self.imageName];
}
@end
