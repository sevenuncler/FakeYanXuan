//
//  SUGoodsThemeItem.h
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUItem.h"

@interface SUGoodsThemeItem : SUItem

@property (nonatomic, strong) SUItem *headerItem;
@property (nonatomic, strong) NSMutableArray<SUItem *> *cellItems;
@property (nonatomic, strong) SUItem *footerItem;

@end
