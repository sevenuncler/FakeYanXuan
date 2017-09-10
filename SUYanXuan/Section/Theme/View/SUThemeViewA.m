//
//  SUThemeViewA.m
//  SUYanXuan
//
//  Created by He on 2017/9/10.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUThemeViewA.h"
#import "SUThemeCellA.h"
#import "SUImageManager.h"

static NSString * const kReuseIdentifier = @"reuseThemeCellA";
@interface SUThemeViewA()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SUThemeViewA

+ (instancetype)initWithFrame:(CGRect)frame itemSize:(CGSize)size item:(SUThemeItem *)item {
    SUThemeViewA *view = [[SUThemeViewA alloc] initWithFrame:frame collectionViewLayout:[SUThemeViewA flowLayoutWithItemSize:size]];
    view.item = item;
    return view;
}

+ (UICollectionViewFlowLayout *)flowLayoutWithItemSize:(CGSize)itemSize {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing       = 10;
    flowLayout.minimumInteritemSpacing  = 0;
    flowLayout.itemSize                 = itemSize;
    flowLayout.scrollDirection          = UICollectionViewScrollDirectionHorizontal;
    return flowLayout;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if(self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor whiteColor];
        self.showsHorizontalScrollIndicator = NO;
        self.dataSource = self;
        self.delegate   = self;
        [self registerClass:[SUThemeCellA class] forCellWithReuseIdentifier:kReuseIdentifier];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.item.subItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SUThemeCellA *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
    SUThemeItem *item = [self.item.subItems objectAtIndex:indexPath.item];
    SUImageManager *imageManager = [SUImageManager defaultImageManager];
    [imageManager setImageView:cell.imageView withUrl:item.themeImageUrl];
    cell.titleLabel.text = item.themeTitle;
    return cell;
}


@end
