//
//  SUGoodsItem.h
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUItem.h"

@interface SUGoodsItem : SUItem

@property (nonatomic, strong)   dispatch_group_t downLoadGroup;
@property (nonatomic, copy)     NSArray  *assets;
@property (nonatomic, copy)     NSString *title;
@property (nonatomic, copy)     NSString *desc;
@property (nonatomic, strong)   UIImage  *coverImage;
@property (nonatomic, assign)   CGFloat  price;
@property (nonatomic, copy)     NSString *brand;
@property (nonatomic, copy)     NSArray  *sizes;
@property (nonatomic, copy)     NSArray  *colors;
@property (nonatomic, copy)     NSArray  *comments;
@property (nonatomic, copy)     NSString *location;
@property (nonatomic, copy)     NSArray  *accessoryAssets;

@end
