//
//  SUGoodsDetailImageView.m
//  SUYanXuan
//
//  Created by He on 2017/9/4.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUGoodsDetailImageView.h"
#import "Macros.h"
#import "SUImageManager.h"
#import "UIView+Layout.h"
#import "SUImageViewCollectionViewCell.h"
#import "SUGoodsItem.h"


static NSString * const reuseIdentifier = @"reuseImageCollectionViewCell";
@interface SUGoodsDetailImageView()<UIScrollViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray   *imageViews;


@end


@implementation SUGoodsDetailImageView

+ (instancetype)viewWithFrame:(CGRect)frame withItem:(SUItem *)item context:(id)context {
    SUGoodsDetailImageView *view = [[SUGoodsDetailImageView alloc] initWithFrame:frame];
    SUGoodsItem *goodsItem = (SUGoodsItem *)item;
    view.pictures = goodsItem.accessoryAssets;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self addSubview:self.collectionView];
        self.minimumZoomScale = 1;
        self.maximumZoomScale = 3;
        self.bounces          = NO;
        self.delegate         = self;
    }
    return self;
}

#pragma mark - Setter & Getter
- (void)setPictures:(NSArray *)pictures {
    if(![_pictures isEqual:pictures]) {
        _pictures = pictures;
        self.contentSize = CGSizeMake(self.size.width, self.size.width*_pictures.count);
        self.collectionView.size = self.contentSize;
        [self.collectionView reloadData];
    }
}

- (UICollectionView *)collectionView {
    if(!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _collectionView.dataSource = self;
        _collectionView.userInteractionEnabled = NO;
        _collectionView.minimumZoomScale = 1;
        [_collectionView registerClass:[SUImageViewCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if(!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(self.size.width, self.size.width);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.pictures.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SUImageViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSURL *url = [self.pictures objectAtIndex:indexPath.item];
    SUImageManager *imageManager = [SUImageManager defaultImageManager];
    __weak typeof(SUImageViewCollectionViewCell *) weakCell = cell;
    if([imageManager objectForKey:url]) {
        UIImage *image = [imageManager objectForKey:url];
        cell.contentImageView.image = image;
    }else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            [imageManager setObject:image forKey:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakCell.contentImageView.image = image;
            });
        });
    }
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.collectionView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if(scrollView.zoomScale < 1){
        scrollView.zoomScale = 1;
    }
}

@end
