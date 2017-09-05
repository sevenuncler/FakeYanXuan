//
//  SUBrandManufactoryItem.h
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUItem.h"

@interface SUBrandManufactoryItem : SUItem

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL   *imageURL;
@property (nonatomic, strong) NSMutableArray<SUBrandManufactoryItem *> *items;
@property (nonatomic, strong) dispatch_queue_t  imageDownloadQueue;

@end
