//
//  SUNewGoodsView.m
//  SUYanXuan
//
//  Created by He on 2017/8/27.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUNewGoodsView.h"
#import "SUCollectionViewCell.h"
#import "SUGoodsCell.h"
#import "SUGoodsItem.h"
#import "Macros.h"

static NSString * const reuseIdentify = @"reuseSUCollectionViewCell";
@interface SUNewGoodsView()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation SUNewGoodsView

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context {
    if(context == nil) {
        UICollectionViewFlowLayout *flowLayout;
        flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(frame.size.width/2.f, frame.size.height);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 40.f;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.minimumLineSpacing = 0.f;
        context = flowLayout;
    }
    SUNewGoodsView *view = [[SUNewGoodsView alloc] initWithFrame:frame collectionViewLayout:context];
    SUGoodsItem *goodsItem = (SUGoodsItem *)item;
    view.items = goodsItem.subItems;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if(self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self registerClass:[SUGoodsCell class] forCellWithReuseIdentifier:reuseIdentify];
        self.backgroundColor = [UIColor whiteColor];
        self.delegate   = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SUGoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentify forIndexPath:indexPath];
    SUGoodsItem *goodsItem = [self.items objectAtIndex:indexPath.item];
    __weak typeof(SUGoodsCell *) weakCell = cell;
    __weak typeof(SUGoodsItem *) weakGoodsItem = goodsItem;
    dispatch_group_notify(goodsItem.downLoadGroup, dispatch_get_main_queue(), ^{
        weakCell.imageView.image = weakGoodsItem.coverImage;
    });
    cell.titelLabel.text = goodsItem.desc;
    cell.priceLabel.text = [NSString stringWithFormat:@"%0.2f", goodsItem.price];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SUGoodsCell *cell = (SUGoodsCell *)[collectionView cellForItemAtIndexPath:indexPath];
    SUGoodsItem *goodsItem = [self.items objectAtIndex:indexPath.item];
    CGRect rect = [cell.imageView convertRect:cell.imageView.bounds toView:[UIApplication sharedApplication].delegate.window];
    if(self.selectedHandler) {
        self.selectedHandler(goodsItem, rect);
    }
}

@end
