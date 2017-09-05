//
//  SUHottestView.m
//  SUYanXuan
//
//  Created by He on 2017/8/28.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUHottestView.h"
#import "SUItem.h"
#import "SUHottestTableViewCell.h"
#import "SUGoodsItem.h"

@interface SUHottestView()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation SUHottestView

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context {
    SUHottestView *view = [[SUHottestView alloc] initWithFrame:frame style:UITableViewStylePlain];
    view.items = item.subItems;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if(self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.scrollEnabled = NO;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const reuseIdentifier = @"reuseHottestViewCell";
    SUHottestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(cell == nil) {
        cell =[[SUHottestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    SUGoodsItem *item = (SUGoodsItem *)[self.items objectAtIndex:indexPath.row];
    __weak typeof(SUGoodsItem *) weakItem = item;
    __weak typeof (SUHottestTableViewCell *) weakCell = cell;
    dispatch_group_notify(item.downLoadGroup, dispatch_get_main_queue(), ^{
        weakCell.leftImageView.image = weakItem.coverImage;
    });
    cell.titleLabel.text = item.title;
    cell.descLabel.text  = item.desc;;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%0.2lf", item.price];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.f;
}

@end
