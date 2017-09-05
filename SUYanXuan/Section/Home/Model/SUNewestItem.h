//
//  SUNewestItem.h
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUItem.h"
@interface SUNewestItem : SUItem

@property (nonatomic, strong) NSURL     *imageURL;
@property (nonatomic, strong) id        target;
@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) NSMutableArray<SUNewestItem *> *items;
@end
