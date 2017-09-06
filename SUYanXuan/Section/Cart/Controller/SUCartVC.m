//
//  SUCartVC.m
//  SUYanXuan
//
//  Created by He on 2017/9/6.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUCartVC.h"
#import "SUCartGoodsCell.h"
#import "SUSelectedGoodsItem.h"


static NSString * const reuseIdentifier = @"reuseCartCell";
@interface SUCartVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *items;

@end

@implementation SUCartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SUCartGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    SUSelectedGoodsItem *item = [self.items objectAtIndex:indexPath.row];
    dispatch_group_notify(item.downLoadGroup, dispatch_get_main_queue(), ^{
        cell.goodsImageView.image = item.coverImage;
    });
    cell.checkImageView.userInteractionEnabled = YES;
    cell.titleLabel.text = item.title;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%lf", item.price];
    cell.sizeLabel.text  = item.selectSizes[0];
    cell.mountLabel.text = [NSString stringWithFormat:@"x%ld", item.selectMount];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.items removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    SUCartGoodsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.checkImageView.selected = YES;
//}
//
//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    SUCartGoodsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.checkImageView.selected = NO;
//}

#pragma mark - Getter & Setter

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[SUCartGoodsCell class] forCellReuseIdentifier:reuseIdentifier];
        _tableView.dataSource = self;
        _tableView.delegate   = self;
    }
    return _tableView;
}

- (NSMutableArray *)items {
    if(!_items) {
        _items = [[NSMutableArray alloc] init];
        {
            SUSelectedGoodsItem *item = [SUSelectedGoodsItem new];
            item.title = @"日式和风声波式电动牙刷";
            item.desc = @"进口刷毛，专利技术";
            item.price = 139.f;
            item.assets = @[[NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"]];
            item.selectMount = 4;
            item.selectSizes = @[@"大号"];
            [_items addObject:item];
        }
        {
            SUSelectedGoodsItem *item = [SUSelectedGoodsItem new];
            item.title = @"日式和风声波式电动牙刷";
            item.desc = @"进口刷毛，专利技术";
            item.price = 139.f;
            item.assets = @[[NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"]];
            item.selectMount = 4;
            item.selectSizes = @[@"大号"];
            [_items addObject:item];
        }
        {
            SUSelectedGoodsItem *item = [SUSelectedGoodsItem new];
            item.title = @"日式和风声波式电动牙刷";
            item.desc = @"进口刷毛，专利技术";
            item.price = 139.f;
            item.assets = @[[NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"]];
            item.selectMount = 4;
            item.selectSizes = @[@"大号"];
            [_items addObject:item];
        }
        {
            SUSelectedGoodsItem *item = [SUSelectedGoodsItem new];
            item.title = @"日式和风声波式电动牙刷";
            item.desc = @"进口刷毛，专利技术";
            item.price = 139.f;
            item.assets = @[[NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"]];
            item.selectMount = 4;
            item.selectSizes = @[@"大号"];
            [_items addObject:item];
        }
        {
            SUSelectedGoodsItem *item = [SUSelectedGoodsItem new];
            item.title = @"日式和风声波式电动牙刷";
            item.desc = @"进口刷毛，专利技术";
            item.price = 139.f;
            item.assets = @[[NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"]];
            item.selectMount = 4;
            item.selectSizes = @[@"大号"];
            [_items addObject:item];
        }

    }
    return _items;
}

@end
