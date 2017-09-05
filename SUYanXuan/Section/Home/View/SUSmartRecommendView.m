//
//  SUSmartRecommendView.m
//  SUYanXuan
//
//  Created by He on 2017/8/30.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUSmartRecommendView.h"
#import "SUGoodsItem.h"
#import "SUGoodsCell.h"


static NSString * const reuseIdentifier = @"reuseGoodsCell";
@interface SUSmartRecommendView()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SUSmartRecommendView

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context {
    if(context == nil) {
        UICollectionViewFlowLayout *flowLayout;
        flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(frame.size.width/2.f- 20, 200.f);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumInteritemSpacing = 40.f;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.minimumLineSpacing = 0.f;
        context = flowLayout;
    }
    SUSmartRecommendView *view = [[SUSmartRecommendView alloc] initWithFrame:frame collectionViewLayout:context];
    SUGoodsItem *goodsItem = (SUGoodsItem *)item;
    view.items = goodsItem.subItems;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if(self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self registerClass:[SUGoodsCell class] forCellWithReuseIdentifier:reuseIdentifier];
        self.backgroundColor = [UIColor whiteColor];
//        self.bounces = NO;
        self.scrollsToTop = YES;
        self.delegate   = self;
        self.dataSource = self;
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld  context:nil];
//        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onDraged:)];
//        [self addGestureRecognizer:panGR];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSUInteger count =  self.items.count %2 == 0 ? self.items.count / 2 : self.items.count / 2 + 1;
    return count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SUGoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSUInteger targetItemIdx = indexPath.section*2 + indexPath.item;
    if( targetItemIdx >= self.items.count){
        cell.titelLabel.text = @"";
        cell.priceLabel.text = @"";
        cell.imageView.image = nil;
        return cell;
    }
    SUGoodsItem *goodsItem = [self.items objectAtIndex:targetItemIdx];
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
static BOOL isUp = NO;
static BOOL isTableViewUp = NO;
static BOOL isEndDecelerate = NO;
- (void)handle:(id)sender {
    NSNotification *notification = (NSNotification *)sender;
    isTableViewUp = [notification.object isEqual:@1]? YES : NO;
    [self scrollViewDidScroll:self];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    isEndDecelerate = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    isEndDecelerate = YES;
}

- (void)onDraged:(UIPanGestureRecognizer *)panGR {
    [self scrollViewDidScroll:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(scrollView.isDecelerating)
        return;
    CGPoint offset = scrollView.contentOffset;
    CGRect rect = [scrollView convertRect:scrollView.bounds toView:[UIApplication sharedApplication].delegate.window];
    
    if(rect.origin.y >= 109) {
        scrollView.scrollEnabled = NO;
        return;
    }
    
    if(offset.y <= 0 && isUp == NO) {
        scrollView.scrollEnabled = NO;
    }else {
        scrollView.scrollEnabled = YES;
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    CGFloat oldOffsetY          = [change[NSKeyValueChangeOldKey] CGPointValue].y;
    CGFloat newOffsetY          = [change[NSKeyValueChangeNewKey] CGPointValue].y;
    CGFloat deltaY              = newOffsetY - oldOffsetY;
    if(deltaY >= 0) {
        isUp = YES;
    }else {
        isUp = NO;
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) ];
}

@end
