//
//  SUGoodsDetailVC.h
//  SUYanXuan
//
//  Created by He on 2017/8/31.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUGoodsItem.h"

@interface SUGoodsDetailVC : UIViewController

@property (nonatomic, strong) SUGoodsItem *goodsItem;

- (instancetype)initWithItem:(SUGoodsItem *)item fromLocation:(CGRect)rect;

@end
