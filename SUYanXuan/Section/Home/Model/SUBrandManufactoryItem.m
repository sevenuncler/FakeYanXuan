//
//  SUBrandManufactoryItem.m
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUBrandManufactoryItem.h"


@implementation SUBrandManufactoryItem
{
//    dispatch_queue_t imageDownloadQueue;
}
@synthesize items = myBrandItems;
- (void)setImageURL:(NSURL *)imageURL {
        _imageURL = imageURL;
        [self image];
}

- (UIImage *)image {
    if(_image == nil) {
        if(self.imageURL != nil) {
            __weak typeof(self) weakSelf = self;
            dispatch_async(self.imageDownloadQueue, ^{
                weakSelf.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:weakSelf.imageURL]];
            });
        }
    }
    return _image;
}

- (NSMutableArray *)items {
    if(myBrandItems == nil) {
        myBrandItems = [[NSMutableArray alloc] init];
    }
    return myBrandItems;
}

- (dispatch_queue_t)imageDownloadQueue {
    if(_imageDownloadQueue == NULL) {
        _imageDownloadQueue = dispatch_queue_create("com.netease.sevenuncle.brandimage", DISPATCH_QUEUE_SERIAL);
    }
    return _imageDownloadQueue;
}

@end
