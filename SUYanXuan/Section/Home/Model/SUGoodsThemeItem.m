//
//  SUGoodsThemeItem.m
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUGoodsThemeItem.h"

@implementation SUGoodsThemeItem

- (NSMutableArray *)cellItems {
    if(_cellItems == nil) {
        _cellItems = [[NSMutableArray alloc] init];
    }
    return _cellItems;
}

@end
