//
//  SUCatagoriesVC.m
//  SUYanXuan
//
//  Created by He on 2017/9/5.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUCatagoriesVC.h"
#import "UIView+Layout.h"
#import "Macros.h"
#import "SUImageManager.h"
#import "SUCollectionViewCellA.h"
#import "SUTableViewCell.h"
#import "SUCatagoriesTableView.h"


static CGFloat const kMenuWidth = 87.f;
static CGFloat  kMainViewWidth = 0;
static NSString * const reuseCollectionCellID = @"reuseCollectionCellID";
static NSString * const reuseCollectionACellID = @"reuseCollectionACellID";

@interface SUCatagoriesVC ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) NSArray     *menuItems;
@property (nonatomic, strong) UIImageView *leftLine;
@property (nonatomic, strong) UICollectionView *mainView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UITableView *pageTableView;

@end

@implementation SUCatagoriesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1];
    kMainViewWidth = SCREEN_WIDTH - kMenuWidth - 2;
    [self.view addSubview:self.menuTableView];
    [self.view addSubview:self.pageTableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([tableView isEqual:self.pageTableView]) {
        static NSString * const reuseTableViewCell = @"reuseTableviewCell";
        SUTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:reuseTableViewCell];
        if(tableViewCell == nil) {
            tableViewCell = [[SUTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseTableViewCell];
        }
        SUCatagoriesTableView *view = [[SUCatagoriesTableView alloc] initWithFrame:CGRectMake(0, 0, kMainViewWidth, self.view.size.height) collectionViewLayout:self.flowLayout];
        tableViewCell.myContentView = view;
        return tableViewCell;
    }
    static NSString *const reuseIdentifier = @"reuseMenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsZero;
    }
    cell.imageView.image = nil;
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14.f];
    cell.textLabel.text = @"菜单";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([tableView isEqual:self.pageTableView]) {
        return self.pageTableView.size.height;
    }else {
        return 44.f;
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14.f];
}
static NSIndexPath *currentIdx = nil;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([tableView isEqual:self.pageTableView]) {
        return;
    }
    [self setUnSelected:currentIdx];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.font = [UIFont systemFontOfSize:18.f];
    [cell.contentView addSubview:self.leftLine];
    [self.pageTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    currentIdx = indexPath;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
    if([tableView isEqual:self.pageTableView]) {
        NSLog(@"%s %@", __func__, indexPath);
        [self setUnSelected:currentIdx];
        [self setSelected:indexPath];
    }
}

- (void)setSelected:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.menuTableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.font = [UIFont systemFontOfSize:18.f];
    [cell.contentView addSubview:self.leftLine];
    currentIdx = indexPath;
}

- (void)setUnSelected:(NSIndexPath *)indexPath {
    if(indexPath == nil) {
        return;
    }
    UITableViewCell *cell = [self.menuTableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14.f];
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

#pragma mark - Getter & Setter 
- (UITableView *)menuTableView {
    if(_menuTableView == nil) {
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMenuWidth, self.view.botton) style:UITableViewStylePlain];
        _menuTableView.dataSource = self;
        _menuTableView.delegate   = self;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _menuTableView;
}

- (NSArray *)menuItems {
    if(!_menuItems) {
        _menuItems = @[@"菜单1", @"菜单2", @"菜单3", @"菜单3", @"菜单3", @"菜单3", @"菜单3", @"菜单3", @"菜单3", @"菜单3", @"菜单3", @"菜单3", @"菜单3"];
    }
    return _menuItems;
}

- (UIImageView *)leftLine {
    if(!_leftLine) {
        _leftLine = [[UIImageView alloc] initWithFrame:CGRectMake(-21, 0, 44, 44)];
        UIImage *image = [UIImage imageNamed:@"竖线"];
        _leftLine.image = image;
    }
    return _leftLine;
}

- (UICollectionView *)mainView {
    if(_mainView == nil) {
        _mainView = [[UICollectionView alloc] initWithFrame:CGRectMake(kMenuWidth + 2, 64, kMainViewWidth, self.view.size.height) collectionViewLayout:self.flowLayout];
        _mainView.backgroundColor = [UIColor whiteColor];
        _mainView.dataSource = self;
        _mainView.delegate   = self;
        [_mainView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseCollectionCellID];
        [_mainView registerClass:[SUCollectionViewCellA class] forCellWithReuseIdentifier:reuseCollectionACellID];
    }
    return _mainView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if(_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];

    }
    return _flowLayout;
}

- (UITableView *)pageTableView {
    if(!_pageTableView) {
        _pageTableView = [[UITableView alloc] initWithFrame:CGRectMake(kMenuWidth + 2, 64, kMainViewWidth, self.view.size.height) style:UITableViewStylePlain];
        _pageTableView.pagingEnabled = YES;
        _pageTableView.dataSource = self;
        _pageTableView.delegate = self;
    }
    return _pageTableView;
}
@end
