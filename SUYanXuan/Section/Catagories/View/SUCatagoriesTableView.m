//
//  SUCatagoriesTableView.m
//  SUYanXuan
//
//  Created by He on 2017/9/6.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUCatagoriesTableView.h"
#import "SUCollectionViewCellA.h"
#import "SUImageManager.h"
#import "Macros.h"

static NSString * const reuseCollectionACellID = @"reuseCollectionACellID";
static NSString * const reuseCollectionCellID = @"reuseCollectionCellID";
static CGFloat  kMainViewWidth = 0;

@interface SUCatagoriesTableView()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SUCatagoriesTableView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if(self = [super initWithFrame:frame collectionViewLayout:layout]) {
        kMainViewWidth = SCREEN_WIDTH - 89 - 2;
        self.dataSource = self;
        self.delegate   = self;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseCollectionCellID];
        [self registerClass:[SUCollectionViewCellA class] forCellWithReuseIdentifier:reuseCollectionACellID];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 2) {
        return 6;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCollectionCellID forIndexPath:indexPath];
    if(0 == indexPath.section) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainViewWidth-100, 100)];
        SUImageManager *imageManager = [SUImageManager defaultImageManager];
        NSString *url = @"http://yanxuan.nosdn.127.net/245b5b3a19ff5427d2e2c66372936964.jpg?imageView&quality=95&thumbnail=1090x310";
        if([imageManager objectForKey:url]) {
            imageView.image = [imageManager objectForKey:url];
        }else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
                [imageManager setObject:image forKey:url];
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image = image;
                });
            });
        }
        cell.backgroundView = imageView;
    }else if(1 == indexPath.section) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kMainViewWidth, 44)];
        label.font = [UIFont systemFontOfSize:11.f];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"饮食分类";
        cell.backgroundView = label;
    }else if(2 == indexPath.section) {
        SUCollectionViewCellA *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCollectionACellID forIndexPath:indexPath];
        cell.myImageView.image = [UIImage imageNamed:@"center.jpeg"];
        cell.myLabel.text      = @"文具";
        return cell;
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return CGSizeMake(kMainViewWidth - 40, 90);
    }else if(1 == indexPath.section) {
        return CGSizeMake(kMainViewWidth, 44);
    }else if(2 == indexPath.section) {
        return CGSizeMake(kMainViewWidth/3 - 30, kMainViewWidth/3 );
    }
    return CGSizeMake(100, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets insets = UIEdgeInsetsMake(15, 10, 5, 10);
    return insets;
}


@end
