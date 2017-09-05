//
//  SUGoodsDetailVC.m
//  SUYanXuan
//
//  Created by He on 2017/8/31.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUGoodsDetailVC.h"
#import "Macros.h"
#import "SUTableViewCell.h"
#import "SUGeneralAutoScrollView.h"
#import "SUCommentCell.h"
#import "SUCommentItem.h"
#import "SUGoodsDetailImageView.h"
#import "UIView+Layout.h"


static CGFloat const kToolBarHeight = 44.f;
static NSString * const reuseIdentifier = @"reuseGoodsCell";
static NSString * const reuseCommentIdentifier = @"reuseCommentCell";

@interface SUGoodsDetailVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) UICollectionView  *picsCollectionView;
@property (nonatomic, assign) CGRect            rect;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UIView            *bottonBar;
@property (nonatomic, strong) UIButton          *backButton;

/* 临时使用  */
@property (nonatomic, strong) SUCommentItem *commentItem;
@property (nonatomic, strong) SUGoodsDetailImageView *goodsDetailImageView;
@property (nonatomic, copy)   NSArray       *URLs;


@end

@implementation SUGoodsDetailVC

- (instancetype)initWithItem:(SUGoodsItem *)item fromLocation:(CGRect)rect {
    if(self = [super init]) {
        self.rect = rect;
        self.goodsItem = item;
        [self.view addSubview:self.tableView];
        [self.view insertSubview:self.bottonBar aboveSubview:self.tableView];
        [self.tableView addSubview:self.backButton];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *navigationController =  (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    [navigationController setNavigationBarHidden:YES animated:YES];
    
    
    NSArray *urls = @[@"http://pic.qiantucdn.com/58pic/19/37/94/09X58PICSrv_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center",
                      @"http://pic.qiantucdn.com/58pic/19/57/86/52a58PICbKI_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center",
                      @"http://pic.qiantucdn.com/58pic/19/56/33/56ebba1d2a4ba_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center",
                      @"http://pic.qiantucdn.com/58pic/14/57/12/48w58PICHfP_1024.jpg!/fw/780/watermark/url/L3dhdGVybWFyay12MS4zLnBuZw==/align/center"];
    /* 商品评论 */
    {
        SUCommentItem *item = [SUCommentItem new];
        item.avatorURL = [NSURL URLWithString:urls[1]];
        item.username  = @"七大爷";
        item.date      = [NSDate date];
        item.content   = @"从外包装到内包装，满满的用心和服务品质感，每一样都超赞，性价比100分。感谢好友推荐，感谢网易，好货真的不贵！";
        item.pics      = @[[NSURL URLWithString:urls[2]], [NSURL URLWithString:urls[1]], [NSURL URLWithString:urls[3]], [NSURL URLWithString:urls[0]]];
        self.commentItem = item;
        item.itemHeight = [SUCommentCell viewWithFrame:CGRectZero item:item context:reuseCommentIdentifier].cellHeight;
        
    }
    /* 商品图片介绍 */
    {
        NSArray *URLs = @[[NSURL URLWithString:urls[1]], [NSURL URLWithString:urls[0]], [NSURL URLWithString:urls[2]], [NSURL URLWithString:urls[3]], [NSURL URLWithString:urls[2]], [NSURL URLWithString:urls[1]], [NSURL URLWithString:urls[0]], [NSURL URLWithString:urls[1]]];
        self.goodsItem.accessoryAssets = URLs;
        self.URLs = URLs;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(0 == section) {
        return 4;
    }else if(1 == section) {
        return 2;
    }else if(2 == section) {
        return 2;
    }
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SUTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    cell.myContentView = nil;
    if(!cell) {
        cell = [[SUTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if(indexPath.section == 0) { /* 产品基本信息 */
        if(indexPath.row == 0) {
            cell.myContentView = self.picsCollectionView;
            [UIView animateWithDuration:0.25f animations:^{
                self.picsCollectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH);
            }];
        }else if(1 == indexPath.row) {
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:@"切尔西牛皮女靴 \n"];
            [titleString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.f], NSForegroundColorAttributeName:[UIColor blackColor]} range:NSMakeRange(0, 6)];
            
            NSAttributedString *detailString = [[NSAttributedString alloc] initWithString:@"经典牛皮切尔西，时尚帅气 \n\n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f], NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
            
            NSAttributedString *priceString = [[NSAttributedString alloc] initWithString:@"$300" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22.f], NSForegroundColorAttributeName:[UIColor redColor]}];
            
            [titleString appendAttributedString:detailString];
            [titleString appendAttributedString:priceString];
            cell.textLabel.attributedText = titleString;
            cell.textLabel.numberOfLines = 4;
        }else if(2 == indexPath.row) {
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.textLabel.font = [UIFont systemFontOfSize:15.f];
            cell.textLabel.text = @"规格数量选择";
            cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        }else if(3 == indexPath.row) {
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.textLabel.font = [UIFont systemFontOfSize:14.f];
            cell.textLabel.text = @"服务：30天无忧退换货 网易自营品牌 \n           48小时免费退货 假一赔十";
            cell.textLabel.numberOfLines = 2;
            cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        }
    }else if(1 == indexPath.section) { /*  评论相关 */
        if(0 == indexPath.row) {
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.textLabel.font = [UIFont systemFontOfSize:14.f];
            cell.textLabel.text     = @"评论(999)";
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
            label.font = [UIFont systemFontOfSize:15.f];
            label.text = @"查看全部 >";
            label.textAlignment = NSTextAlignmentRight;
            cell.accessoryView = label;

        }else if(1 == indexPath.row) {
            SUCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseCommentIdentifier];
            if(!cell) {
                cell = [SUCommentCell viewWithFrame:CGRectZero item:self.commentItem context:reuseCommentIdentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            return cell;
        }
    }else if(2 == indexPath.section){ /* 商品图文详情 */
        if(0 == indexPath.item) {
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont systemFontOfSize:15.f];
            cell.textLabel.text = @"商品详情";
        }else if(1 == indexPath.item) {
            SUGoodsDetailImageView *view = [SUGoodsDetailImageView viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*self.goodsItem.accessoryAssets.count) withItem:self.goodsItem context:nil];
            view.scrollEnabled = NO;
            cell.myContentView = view;
        }

    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(0 == indexPath.section) {
        if(1 == indexPath.row) {
            return 140.f;
        }else if(2 == indexPath.row) {
            return 44.f;
        }else if(3 == indexPath.row) {
            return 65.f;
        }
    }else if(1 == indexPath.section) {
        if(0 == indexPath.row) {
            return 44.f;
        }else if(1 == indexPath.row) {
            return self.commentItem.itemHeight;
        }
    }else if (2 == indexPath.section) {
        if(0 == indexPath.item) {
            return 44.f;
        }else if(1 == indexPath.item) {
            return SCREEN_WIDTH*self.goodsItem.accessoryAssets.count;
        }
    }
    return SCREEN_WIDTH;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.f;
}

#pragma mark - Getter & Setter
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - kToolBarHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1];
        _tableView.dataSource = self;
        _tableView.delegate   = self;
    }
    return _tableView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if(!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumLineSpacing = 0.f;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _flowLayout.minimumLineSpacing = 0.f;
    }
    return _flowLayout;
}

- (UICollectionView *)picsCollectionView {
    if(_picsCollectionView == nil) {
        _picsCollectionView = [SUGeneralAutoScrollView viewWithFrame:self.rect item:self.goodsItem context:self.flowLayout];
    }
    return _picsCollectionView;
}

- (SUGoodsDetailImageView *)goodsDetailImageView {
    if(!_goodsDetailImageView) {
        _goodsDetailImageView = [[SUGoodsDetailImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _goodsDetailImageView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*3);
        _goodsDetailImageView.minimumZoomScale = 1;
        _goodsDetailImageView.maximumZoomScale = 3;
        _goodsDetailImageView.bounces          = NO;
        _goodsDetailImageView.pictures = self.URLs;
    }
    return _goodsDetailImageView;
}

- (UIView *)bottonBar {
    if(_bottonBar == nil) {
        _bottonBar = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.botton-44, SCREEN_WIDTH, 44)];
        _bottonBar.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1];
        //客服
        UIButton *imButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [imButton setImage:[UIImage imageNamed:@"客服1"] forState:UIControlStateNormal];
        [imButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        imButton.frame = CGRectMake(0, 0, 30, 30);
        imButton.center = CGPointMake(22, 22);
        
        //购物车
        UIButton *basketButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [basketButton setImage:[UIImage imageNamed:@"购物车"] forState:UIControlStateNormal];
        basketButton.frame = CGRectMake(44, 0, 40, 40);
        basketButton.centerY = 22;
        [basketButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //收藏
        UIButton *markButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markButton setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
        markButton.frame = CGRectMake(100, 0, 28, 28);
        markButton.centerY = 22;
        [markButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //立即购买
        UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
        buyButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        buyButton.frame = CGRectMake(132, 0, 120, 44);
        [buyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //加入购物车
        UIButton *addToBasketButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [addToBasketButton setTitle:@"加入购物车" forState:UIControlStateNormal];
        addToBasketButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        addToBasketButton.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.85f];
        addToBasketButton.frame = CGRectMake(252, 0, 123, 44);
        [addToBasketButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_bottonBar addSubview:imButton];
        [_bottonBar addSubview:basketButton];
        [_bottonBar addSubview:markButton];
        [_bottonBar addSubview:buyButton];
        [_bottonBar addSubview:addToBasketButton];
    }
    return _bottonBar;
}

- (UIButton *)backButton {
    if(!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        _backButton.left = 15;
        _backButton.top  = 20;
        _backButton.size = CGSizeMake(20, 20);
        [_backButton addTarget:self action:@selector(onBackAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

#pragma mark - 事件响应
- (void)onBackAction:(id)sender {
    UINavigationController *navigationVC = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    [navigationVC popViewControllerAnimated:YES];
}

- (void)onPinchAction:(UIPinchGestureRecognizer *)sender {
//    [self.goodsDetailImageView setZoomScale:0 animated:YES];
    NSLog(@"%lf", sender.scale);
}


@end
