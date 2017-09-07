//
//  SUProfileVC.m
//  SUYanXuan
//
//  Created by He on 2017/9/7.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUProfileVC.h"
#import "SUProfileItem.h"
#import "SUSectionItem.h"
#import "SUBasicProfileView.h"
#import "SUBasicProfileItem.h"
#import "SUTableViewCell.h"
#import "Macros.h"
#import "UIImage+Size.h"

static NSString * const reuseIdentifier = @"reuseProfileCell";
@interface SUProfileVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray<SUSectionItem *>    *items;

@end

@implementation SUProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SUSectionItem *item = [self.items objectAtIndex:section];
    return item.subItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    SUSectionItem *sctionItem = [self.items objectAtIndex:indexPath.section];
    if([sctionItem.subItems[indexPath.row] isKindOfClass:[SUBasicProfileItem class]]) {
        static NSString *const reuseID = @"reuseTableViewCell";
        SUTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if(!tableViewCell) {
            tableViewCell = [[SUTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        }
        tableViewCell.myContentView = [[SUBasicProfileView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        return tableViewCell;
    }
    SUProfileItem *profileItem = sctionItem.subItems[indexPath.row];
    cell.imageView.image = [profileItem.image imageWithSize:CGSizeMake(30,30)];    cell.textLabel.text  = profileItem.name;
    cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.f;
}

#pragma mark - Getter & Setter
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
        _tableView.dataSource = self;
        _tableView.delegate   = self;
    }
    return _tableView;
}

- (NSMutableArray *)items {
    if(!_items) {
        _items = [NSMutableArray array];
        {
            SUSectionItem *sectionItem = [SUSectionItem new];
            
            SUProfileItem *profileItem = [SUProfileItem new];
            profileItem.name = @"我的订单";
            
            SUBasicProfileItem *basicItem = [SUBasicProfileItem new];
            
            sectionItem.subItems = @[profileItem, basicItem].mutableCopy;
            [_items addObject:sectionItem];
        }
        {
            SUSectionItem *sectionItem = [SUSectionItem new];

            SUProfileItem *profileItem1 = [SUProfileItem new];
            profileItem1.name  = @"我的拼团订单";
            profileItem1.image = [UIImage imageNamed:@"订单"];
            
            sectionItem.subItems = @[profileItem1].mutableCopy;
            [_items addObject:sectionItem];
        }
        {
            SUSectionItem *sectionItem = [SUSectionItem new];
            
            SUProfileItem *profileItem1 = [SUProfileItem new];
            profileItem1.name  = @"我的收藏";
            profileItem1.image = [UIImage imageNamed:@"收藏1"];
            
            SUProfileItem *profileItem2 = [SUProfileItem new];
            profileItem2.name  = @"优惠券";
            profileItem2.image = [UIImage imageNamed:@"优惠券1"];
            
            SUProfileItem *profileItem3 = [SUProfileItem new];
            profileItem3.name  = @"礼品卡";
            profileItem3.image = [UIImage imageNamed:@"礼品卡"];
            
            SUProfileItem *profileItem4 = [SUProfileItem new];
            profileItem4.name  = @"地址管理";
            profileItem4.image = [UIImage imageNamed:@"地址"];
            
            sectionItem.subItems = @[profileItem1, profileItem2, profileItem3, profileItem4].mutableCopy;
            [_items addObject:sectionItem];
        }
        {
            SUSectionItem *sectionItem = [SUSectionItem new];
            
            SUProfileItem *profileItem1 = [SUProfileItem new];
            profileItem1.name  = @"在线客服";
            profileItem1.image = [UIImage imageNamed:@"在线客服"];
            
            SUProfileItem *profileItem2 = [SUProfileItem new];
            profileItem2.name  = @"帮助中心";
            profileItem2.image = [UIImage imageNamed:@"帮助中心"];
            
            SUProfileItem *profileItem3 = [SUProfileItem new];
            profileItem3.name  = @"系统设置";
            profileItem3.image = [UIImage imageNamed:@"系统设置"];
            
            sectionItem.subItems = @[profileItem1, profileItem2, profileItem3].mutableCopy;
            [_items addObject:sectionItem];
        }
    }
    return _items;
}


@end
