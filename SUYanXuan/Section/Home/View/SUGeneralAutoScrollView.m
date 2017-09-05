//
//  SUGeneralAutoScrollView.m
//  SUYanXuan
//
//  Created by He on 2017/9/1.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUGeneralAutoScrollView.h"
#import "SUCollectionViewCell.h"
#import "Macros.h"
#import "SUGoodsItem.h"
#import "UIView+Layout.h"

static NSString * const reuseIdentify = @"reuseGeneralCollectionViewCell";
@interface SUGeneralAutoScrollView()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) UIPageControl  *pageControl;
@property (nonatomic, strong) NSTimer        *timer;

@end

@implementation SUGeneralAutoScrollView


+ (instancetype)viewWithFrame:(CGRect)frame item:(SUItem *)item context:(id)context {
    SUGeneralAutoScrollView *view = [[SUGeneralAutoScrollView alloc] initWithFrame:frame collectionViewLayout:context];
    SUGoodsItem *goodsItem = (SUGoodsItem *)item;
    view.items = goodsItem.assets.copy;
    return view;
}

- (instancetype)init {
    if(self = [super init]) {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if(self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self registerClass:[SUCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentify];
        self.backgroundColor = [UIColor redColor];
        self.delegate   = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SUCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSURL *imageURL = [self.items objectAtIndex:indexPath.item];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = image;
        });
    });

    cell.myContentView = imageView;
    return cell;
}


#pragma mark - Getter & Setter
- (NSArray *)items {
    if(_items == nil) {
        _items = [NSArray array];
    }
    return _items;
}

- (UIPageControl *)pageControl {
    if(!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.size.width/2, self.size.height - 60, 100, 50)];
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}

- (NSTimer *)timer {
    if(_timer == nil) {
        __weak typeof(self) weakSelf = self;
        _timer = [NSTimer timerWithTimeInterval:5.f repeats:YES block:^(NSTimer * _Nonnull timer) {
            if(weakSelf.items.count < 1) {
                return ;
            }
            weakSelf.pageControl.numberOfPages = weakSelf.items.count;
            dispatch_async(dispatch_get_main_queue(), ^{
                NSUInteger nextPage = (weakSelf.pageControl.currentPage + 1) % weakSelf.items.count;
                [weakSelf scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextPage inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
                weakSelf.pageControl.currentPage = nextPage;
            });
            
        }];
    }
    return _timer;
}

- (void)dealloc {
    [self.timer invalidate];
}

@end
