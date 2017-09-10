//
//  SUThemeVC.m
//  SUYanXuan
//
//  Created by He on 2017/9/8.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUThemeVC.h"
#import "SUThemeCell.h"
#import "Macros.h"
#import "SUThemeItem.h"
#import "SUImageManager.h"
#import "SUTableViewCell.h"
#import "SUThemeViewA.h"
#import "Macros.h"

static NSString * const kReuseIdentifier  = @"reuseThemeCell";
static NSString * const kReuseIdentifier1 = @"reuseTableViewCell";
@interface SUThemeVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) SUThemeItem    *itemA;

@end

@implementation SUThemeVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(0 == section) {
        return 1;
    }
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(0 == indexPath.section) {
        SUTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier1 forIndexPath:indexPath];
        SUThemeViewA *viewA = [SUThemeViewA initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100.f) itemSize:CGSizeMake(150.f, 75.f) item:self.itemA];
        cell.myContentView = viewA;
        return cell;
    }
    SUThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    SUImageManager *imageManager = [SUImageManager defaultImageManager];
    SUThemeItem *item = [self.items objectAtIndex:indexPath.row];
    [imageManager setImageView:cell.themeImageView withUrl:item.themeImageUrl];
    cell.themeTitleLabel.text       = item.themeTitle;
    cell.themeSubTitleLabel.text    = item.themeSubTitle;
    cell.themePriceLabel.text       = item.themePrice;
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(0 == indexPath.section) {
        return 100.f;
    }
    return SCREEN_WIDTH - 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.f;
}

#pragma mark - Getter & Setter
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[SUThemeCell class] forCellReuseIdentifier:kReuseIdentifier];
        [_tableView registerClass:[SUTableViewCell class] forCellReuseIdentifier:kReuseIdentifier1];
        _tableView.dataSource = self;
        _tableView.delegate   = self;
    }
    return _tableView;
}

- (SUThemeItem *)itemA {
    if(!_itemA) {
        _itemA = [SUThemeItem new];
        {
            SUThemeItem *item = [SUThemeItem new];
            item.themeImageUrl = @"http://yanxuan.nosdn.127.net/f08cc5099895fcda5707e2b874e9af8f.png?imageView&quality=95&thumbnail=250x250";
            item.themeTitle    = @"丁磊私物";
            item.themeSubTitle = @"\"数十款商品超值特惠中\"";
            item.themePrice    = @"1000元起";
            _itemA.subItems = @[item, item, item, item, item].mutableCopy;
        }
    }
    return _itemA;
}

- (NSMutableArray *)items {
    if(!_items) {
        _items = [NSMutableArray array];
        {
            SUThemeItem *item = [SUThemeItem new];
            item.themeImageUrl = @"http://yanxuan.nosdn.127.net/c8b7ca1ed29cccac31310a04206cbdfb.png?imageView&quality=95&thumbnail=250x250";
            item.themeTitle    = @"丁磊私物推荐";
            item.themeSubTitle = @"\"数十款商品超值特惠中\"";
            item.themePrice    = @"1000元起";
            [_items addObject:item];
        }
        {
            SUThemeItem *item = [SUThemeItem new];
            item.themeImageUrl = @"http://yanxuan.nosdn.127.net/f08cc5099895fcda5707e2b874e9af8f.png?imageView&quality=95&thumbnail=250x250";
            item.themeTitle    = @"8件秋天应该做的小事";
            item.themeSubTitle = @"\"数十款商品超值特惠中\"";
            item.themePrice    = @"1000元起";
            [_items addObject:item];
        }
        {
            SUThemeItem *item = [SUThemeItem new];
            item.themeImageUrl = @"http://yanxuan.nosdn.127.net/fa75e3af91b461d92f95220fbb126914.jpg?imageView&quality=95&thumbnail=1090x310";
            item.themeTitle    = @"8件秋天应该做的小事";
            item.themeSubTitle = @"\"数十款商品超值特惠中\"";
            item.themePrice    = @"1000元起";
            [_items addObject:item];
        }
        {
            SUThemeItem *item = [SUThemeItem new];
            item.themeImageUrl = @"http://yanxuan.nosdn.127.net/f0132986dbf16e6f04c67bdd8286e998.png?imageView&quality=95&thumbnail=250x250";
            item.themeTitle    = @"8件秋天应该做的小事";
            item.themeSubTitle = @"\"数十款商品超值特惠中\"";
            item.themePrice    = @"1000元起";
            [_items addObject:item];
        }
        [_items addObjectsFromArray:_items];
        [_items addObjectsFromArray:_items];
        [_items addObjectsFromArray:_items];
        [_items addObjectsFromArray:_items];

    }
    return _items;
}

@end
