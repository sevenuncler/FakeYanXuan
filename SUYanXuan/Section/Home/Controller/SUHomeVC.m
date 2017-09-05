//
//  SUHomeVC.m
//  SUYanXuan
//
//  Created by He on 2017/8/22.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUHomeVC.h"
#import "Macros.h"
#import "SURecommendVC.h"
#import "SULimitTimeVC.h"
#import "SUCollectionViewCell.h"

static CGFloat kWidth       = 50.f;
static CGFloat kHeight      = 44.f;
static CGFloat kLineHeight  = 2.f;
static NSString * const reuseCollectionID = @"reuseCollectionCell";

@interface SUHomeVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy)   NSArray *catagories;
@property (nonatomic, strong) UISegmentedControl *catagorySegment;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView  *underLine;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

/* VC */
@property (nonatomic, strong) SURecommendVC *recommendVC;
@property (nonatomic, strong) SULimitTimeVC *limitTimeVC;



@end

@implementation SUHomeVC

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    /* 分类 */
    NSArray *catagories = @[@"推荐", @"限时购", @"居家", @"餐厨", @"配件", @"服饰", @"电器", @"玩具",@"洗护",@"杂货",@"饮食",@"婴童",@"志趣"];
    self.catagories = catagories;
    
    UISegmentedControl *catagorySegment = [[UISegmentedControl alloc] initWithItems:catagories];
    catagorySegment.tintColor = [UIColor clearColor];
    NSDictionary *normalTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]};
    [catagorySegment setTitleTextAttributes:normalTextAttributes
                                   forState:UIControlStateNormal];
    NSDictionary *selectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor redColor]};
    [catagorySegment setTitleTextAttributes:selectedTextAttributes
                                   forState:UIControlStateSelected];
    catagorySegment.frame = CGRectMake(0, 0, kWidth*catagories.count, 44);
    [catagorySegment addTarget:self action:@selector(onSegmentSelected:) forControlEvents:UIControlEventValueChanged];
    [catagorySegment setSelectedSegmentIndex:0];
    self.catagorySegment = catagorySegment;
    
    /* 滚动视图 */
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 44)];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = catagorySegment.bounds.size;
    scrollView.contentOffset = CGPointMake(0, 0);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    self.scrollView = scrollView;

    /* 选中下划线 */
    self.underLine = [[UIView alloc] initWithFrame:CGRectMake(0, kHeight - kLineHeight, kWidth, kLineHeight)];
    self.underLine.backgroundColor = [UIColor redColor];
    
    [self.scrollView addSubview:self.catagorySegment];
    [self.scrollView insertSubview:self.underLine aboveSubview:self.catagorySegment];
    [self.view addSubview:self.scrollView];

    /* 内容视图 */
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    self.scrollView.contentOffset = CGPointMake(0, 0);
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.catagories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SUCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCollectionID forIndexPath:indexPath];
    if(indexPath.item ==0) {
        cell.myContentView = self.recommendVC.view;
    }else if(indexPath.item == 1) {
        cell.myContentView = self.limitTimeVC.view;
    }else {
        cell.myContentView = nil;
        if(indexPath.item %2 == 0) {
            cell.backgroundColor = [UIColor redColor];
        }else {
            cell.backgroundColor = [UIColor whiteColor];
        }
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint contentOffset = scrollView.contentOffset;
    NSInteger idx = contentOffset.x / SCREEN_WIDTH;
    self.catagorySegment.selectedSegmentIndex = idx;
    [self moveUnderLine:idx];
}

#pragma mark - 功能函数
- (void)moveUnderLine:(NSInteger)idx {
    self.underLine.frame = CGRectMake(idx*kWidth, kHeight - kLineHeight, kWidth, kLineHeight);
    if(idx > 4 && idx < self.catagories.count-2) {
        self.scrollView.contentOffset = CGPointMake((idx-4)*kWidth, 0);
    }else if(idx <= 4) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
}

#pragma mark - 控件事件响应
- (void)onSegmentSelected:(UISegmentedControl *)sender {
    NSInteger idx = sender.selectedSegmentIndex;
    self.underLine.frame = CGRectMake(idx*kWidth, kHeight - kLineHeight, kWidth, kLineHeight);
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:idx inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}


#pragma mark - Getter & Setter
- (SURecommendVC *)recommendVC {
    if(_recommendVC == nil) {
        _recommendVC = [[SURecommendVC alloc] init];
    }
    return _recommendVC;
}

- (SULimitTimeVC *)limitTimeVC {
    if(_limitTimeVC == nil) {
        _limitTimeVC = [[SULimitTimeVC alloc] init];
    }
    return _limitTimeVC;
}

- (UICollectionView *)collectionView {
    if(!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 44 -44) collectionViewLayout:self.flowLayout];
        [_collectionView registerClass:[SUCollectionViewCell class] forCellWithReuseIdentifier:reuseCollectionID];
        
        _collectionView.delegate    = self;
        _collectionView.dataSource  = self;
        _collectionView.pagingEnabled = YES;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if(!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 44 -44);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 40.f;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _flowLayout.minimumLineSpacing = 0.f;
    }
    return _flowLayout;
}
@end
