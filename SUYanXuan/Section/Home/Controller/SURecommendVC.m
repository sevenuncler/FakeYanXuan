//
//  SURecommendVC.m
//  SUYanXuan
//
//  Created by He on 2017/8/25.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SURecommendVC.h"
#import "SUNewestView.h"
#import "Macros.h"
#import "SUItem.h"
#import "SUNewestItem.h"
#import "SUTableViewCell.h"
#import "SUBrandManufactoryView.h"
#import "SUGoodsThemeItem.h"
#import "SUBrandManufactoryItem.h"
#import "SUGoodsCell.h"
#import "SUGoodsItem.h"
#import "SUNewGoodsView.h"
#import "SUHottestView.h"
#import "SUSmartRecommendView.h"
#import "SUGoodsDetailVC.h"

static BOOL isUpScroll = NO;
@interface SURecommendVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *items;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) SUSmartRecommendView  *smartRecommendView;

@end

@implementation SURecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    NSArray *urls = @[@"http://pic.qiantucdn.com/58pic/19/37/94/09X58PICSrv_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center",
                      @"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center",
                      @"http://pic.qiantucdn.com/58pic/19/56/33/56ebba1d2a4ba_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center",
                      @"http://pic.qiantucdn.com/58pic/14/57/12/48w58PICHfP_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
    /* 数据加载 */
    {
        SUNewestItem *newestItem0 = [SUNewestItem new];
        newestItem0.imageURL = [NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/37/94/09X58PICSrv_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
        newestItem0.itemHeight = SCREEN_WIDTH*0.618f;
        SUNewestItem *newestItem1 = [SUNewestItem new];
        newestItem1.imageURL = [NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
        newestItem1.itemHeight = SCREEN_WIDTH*0.618f;
        SUNewestItem *newestItem2 = [SUNewestItem new];
        newestItem2.imageURL = [NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/56/33/56ebba1d2a4ba_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
        newestItem2.itemHeight = SCREEN_WIDTH*0.618f;
        SUNewestItem *newestItem3 = [SUNewestItem new];
        newestItem3.imageURL = [NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/14/57/12/48w58PICHfP_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
        newestItem3.itemHeight = SCREEN_WIDTH*0.618f;
        SUNewestItem *newestItem = [SUNewestItem new];
        newestItem.items = @[newestItem0, newestItem1, newestItem2, newestItem3].mutableCopy;
        newestItem.itemHeight = SCREEN_WIDTH*0.618f;
        
        SUGoodsThemeItem *themeItem = [SUGoodsThemeItem new];
        [themeItem.cellItems addObject:newestItem];
        
        [self.items addObject:themeItem];
    }
    
    /* 品牌制造商数据 */
    {
        SUBrandManufactoryItem *item1 = [SUBrandManufactoryItem new];
        item1.imageURL = [NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/37/94/09X58PICSrv_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
        SUBrandManufactoryItem *item2 = [SUBrandManufactoryItem new];
        item2.imageURL = [NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
        SUBrandManufactoryItem *item3 = [SUBrandManufactoryItem new];
        item3.imageURL = [NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/19/56/33/56ebba1d2a4ba_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
        SUBrandManufactoryItem *item = [SUBrandManufactoryItem new];
        item.items = @[item1, item2, item3].mutableCopy;
        item.itemHeight = SCREEN_WIDTH *0.618f;
        
        SUGoodsThemeItem *themeItem = [SUGoodsThemeItem new];
        [themeItem.cellItems addObject:item];
        
        [self.items addObject:themeItem];
    }
    
    /* 新品首发 */
    {
        SUGoodsItem *item1 = [SUGoodsItem new];
        item1.desc = @"心动告白 项链";
        item1.price = 139.f;
        item1.assets = @[[NSURL URLWithString:urls[3]], [NSURL URLWithString:urls[0]],[NSURL URLWithString:urls[2]],[NSURL URLWithString:urls[1]],[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item2 = [SUGoodsItem new];
        item2.desc = @"小馒头 多色双肩包";
        item2.price = 59.f;
        item2.assets = @[[NSURL URLWithString:urls[1]]];
        
        SUGoodsItem *item3 = [SUGoodsItem new];
        item3.desc = @"女士多强度无缝运动衣";
        item3.price = 189.f;
        item3.assets = @[[NSURL URLWithString:urls[2]]];
        
        SUGoodsItem *item4 = [SUGoodsItem new];
        item4.desc = @"花样年华 女士小白鞋";
        item4.price = 13329.f;
        item4.assets = @[[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item5 = [SUGoodsItem new];
        item5.desc = @"花样年华 女士小白鞋";
        item5.price = 13329.f;
        item5.assets = @[[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item = [SUGoodsItem new];
        item.subItems = @[item1, item2, item3, item4].mutableCopy;
        
        SUGoodsThemeItem *themeItem = [SUGoodsThemeItem new];
        themeItem.cellItems = @[item].mutableCopy;
        item.itemHeight = SCREEN_WIDTH *0.618f;
        
        [self.items addObject:themeItem];
    }
    
    /* 人气推荐 */
    {
        SUGoodsItem *item1 = [SUGoodsItem new];
        item1.title = @"日式和风声波式电动牙刷";
        item1.desc = @"进口刷毛，专利技术";
        item1.price = 139.f;
        item1.assets = @[[NSURL URLWithString:urls[0]]];
        
        SUGoodsItem *item2 = [SUGoodsItem new];
        item2.title = @"AB弹簧独立床";
        item2.desc = @"小馒头 多色双肩包";
        item2.price = 59.f;
        item2.assets = @[[NSURL URLWithString:urls[1]]];
        
        SUGoodsItem *item3 = [SUGoodsItem new];
        item3.title = @"AB弹簧独立床";
        item3.desc = @"纯牛奶 12*2提";
        item3.price = 189.f;
        item3.assets = @[[NSURL URLWithString:urls[2]]];
        
        SUGoodsItem *item4 = [SUGoodsItem new];
        item3.title = @"AB弹簧独立床";
        item4.desc = @"花样年华 女士小白鞋";
        item4.price = 13329.f;
        item4.assets = @[[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item = [SUGoodsItem new];
        item.subItems = @[item1, item2, item3, item4].mutableCopy;
        
        SUGoodsThemeItem *themeItem = [SUGoodsThemeItem new];
        themeItem.cellItems = @[item].mutableCopy;
        item.itemHeight = 450.f;
        
        [self.items addObject:themeItem];
    }
    
    /* 猜你喜欢 */
    {
        SUGoodsItem *item1 = [SUGoodsItem new];
        item1.desc = @"心动告白 项链";
        item1.price = 139.f;
        item1.assets = @[[NSURL URLWithString:urls[0]]];
        
        SUGoodsItem *item2 = [SUGoodsItem new];
        item2.desc = @"小馒头 多色双肩包";
        item2.price = 59.f;
        item2.assets = @[[NSURL URLWithString:urls[1]]];
        
        SUGoodsItem *item3 = [SUGoodsItem new];
        item3.desc = @"女士多强度无缝运动衣";
        item3.price = 189.f;
        item3.assets = @[[NSURL URLWithString:urls[2]]];
        
        SUGoodsItem *item4 = [SUGoodsItem new];
        item4.desc = @"花样年华 女士小白鞋";
        item4.price = 13329.f;
        item4.assets = @[[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item5 = [SUGoodsItem new];
        item5.desc = @"花样年华 女士小白鞋";
        item5.price = 13329.f;
        item5.assets = @[[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item6 = [SUGoodsItem new];
        item6.desc = @"花样年华 女士小白鞋";
        item6.price = 13329.f;
        item6.assets = @[[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item7 = [SUGoodsItem new];
        item7.desc = @"花样年华 女士小白鞋";
        item7.price = 13329.f;
        item7.assets = @[[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item8 = [SUGoodsItem new];
        item8.desc = @"花样年华 女士小白鞋";
        item8.price = 13329.f;
        item8.assets = @[[NSURL URLWithString:urls[3]]];
        
        SUGoodsItem *item = [SUGoodsItem new];
        item.subItems = @[item1, item2, item3, item4, item5, item6, item7, item8].mutableCopy;
        
        SUGoodsThemeItem *themeItem = [SUGoodsThemeItem new];
        themeItem.cellItems = @[item].mutableCopy;
        item.itemHeight = self.tableView.frame.size.height;
        
        [self.items addObject:themeItem];
    }

    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SUGoodsThemeItem *themeItem = [self.items objectAtIndex:section];
    return themeItem.cellItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const reuseIdentifier = @"reuseCell";
    SUTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell) {
        cell = [[SUTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }

    if(indexPath.section == 0) {     /* 最新热门商品 */
        SUGoodsThemeItem *themeItem = [self.items objectAtIndex:indexPath.section];
        cell.myContentView = [SUNewestView viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.618f) item:[themeItem.cellItems objectAtIndex:0] context:self.flowLayout];
    }else if(indexPath.section == 1) {     /* 品牌制造商 */
        SUGoodsThemeItem *themeItem = [self.items objectAtIndex:indexPath.section];
        SUBrandManufactoryView *view = [SUBrandManufactoryView  viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.618f) item:[themeItem.cellItems objectAtIndex:0] context:nil];
        cell.myContentView = view;
    }else if(indexPath.section == 2) { /* 新品推荐 */
        SUGoodsThemeItem *themeItem = [self.items objectAtIndex:indexPath.section];
        SUNewGoodsView *newGoodsView = [SUNewGoodsView viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.618f) item:themeItem.cellItems[0] context:nil];
        newGoodsView.selectedHandler = ^(SUItem *item, CGRect rect) {
            SUGoodsDetailVC *goodsDetailVC = [[SUGoodsDetailVC alloc] initWithItem:(SUGoodsItem *)item fromLocation:rect];
            UINavigationController *navigationController =  (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
            [navigationController pushViewController:goodsDetailVC animated:NO];
        };
        cell.myContentView = newGoodsView;
    }else if(indexPath.section == 3) { /* 人气推荐 */
        SUGoodsThemeItem *themeItem = [self.items objectAtIndex:indexPath.section];
        SUHottestView *hottestView = [SUHottestView viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 450.f) item:themeItem.cellItems[0] context:nil];
        cell.myContentView = hottestView;
    }else if(indexPath.section == 4) { /* 人气推荐 */
        cell.myContentView = self.smartRecommendView;
    }

    return cell;
}
- (void)handle:(id) sender {
    NSLog(@"%s", __func__);
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section == 1) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"品牌制造商";
        label.font = [UIFont systemFontOfSize:13.f];
        return label;
    }else if(section == 2) {
        UIImageView *view = [UIImageView new];
        view.image = [UIImage imageNamed:@"center"];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
        label.text = @"周一周四·新品首发";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16.f];
        label.backgroundColor = [UIColor whiteColor];
        [view addSubview:label];
        return view;
    }else if(section == 3) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"人气推荐 >";
        label.font = [UIFont systemFontOfSize:13.f];
        return label;
    }else if(section == 4) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"猜你喜欢";
        label.font = [UIFont systemFontOfSize:13.f];
        return label;
    }
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if(section == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"            网易自营品牌      30天无忧退换      48小时快速退货";
        label.font = [UIFont systemFontOfSize:13.f];
        return label;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SUGoodsThemeItem *item = [self.items objectAtIndex:indexPath.section];
    SUItem *cellItem = [item.cellItems objectAtIndex:indexPath.row];
    return cellItem.itemHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 1 || section == 3 || section == 4) {
        return 55.f;
    }else if(section == 2) {
        return 80.f;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if(section == 0) {
        return 40.f;
    }else if(section == 1) {
        return 10.f;
    }
    return 10.f;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
    NSLog(@"%@", indexPath);
    if(indexPath.section == self.items.count -1) {
        NSLog(@"");
    }
}



#pragma mark - Getter & Setter
- (SUSmartRecommendView *)smartRecommendView {
    if(_smartRecommendView == nil) {
        SUGoodsThemeItem *themeItem = [self.items objectAtIndex:4];
        _smartRecommendView = [SUSmartRecommendView viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.tableView.bounds.size.height) item:themeItem.cellItems[0] context:nil];
        [[NSNotificationCenter defaultCenter] addObserver:_smartRecommendView selector:@selector(handle:) name:@"com" object:nil];
    }
    return _smartRecommendView;
}
- (UICollectionViewFlowLayout *)flowLayout {
    if(!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.618f);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 40.f;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _flowLayout.minimumLineSpacing = 0.f;
    }
    return _flowLayout;
}


- (NSMutableArray *)items {
    if(_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 44 - 44) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithWhite:0.98f alpha:1];
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        [self.tableView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld  context:nil];
    }
    return _tableView;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    CGFloat oldOffsetY          = [change[NSKeyValueChangeOldKey] CGPointValue].y;
    CGFloat newOffsetY          = [change[NSKeyValueChangeNewKey] CGPointValue].y;
    CGFloat deltaY              = newOffsetY - oldOffsetY;
    if(deltaY >= 0) {
        isUpScroll = YES;
    }else {
        isUpScroll = NO;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"com" object:isUpScroll?@1:@0];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self.smartRecommendView];
}

@end
