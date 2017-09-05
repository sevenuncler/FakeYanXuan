//
//  SUGoodsItem.m
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUGoodsItem.h"
@interface SUGoodsItem()
{
}


@end

@implementation SUGoodsItem

- (UIImage *)coverImage {
    if(_coverImage == nil) {
        if(self.assets && self.assets.count>0 && [self.assets[0]  isKindOfClass:[NSURL class]]) {
            NSURL *url = self.assets[0];
            dispatch_group_async(self.downLoadGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
               _coverImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            });
        }
    }
    return _coverImage;
}

- (dispatch_group_t)downLoadGroup {
    if(_downLoadGroup == NULL) {
        _downLoadGroup = dispatch_group_create();
    }
    return _downLoadGroup;
}

- (void)setAssets:(NSArray *)assets {
    _assets = assets.copy;
    if(_assets && _assets.count>0 && [_assets[0]  isKindOfClass:[NSURL class]]) {
        NSURL *url = _assets[0];
        __weak typeof(self) weakSelf = self;
//        __weak typeof(NSArray *) weakAssets = _assets;
        dispatch_group_async(self.downLoadGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            weakSelf.coverImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        });
    }
}
@end
