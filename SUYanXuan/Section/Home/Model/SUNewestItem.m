//
//  SUNewestItem.m
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUNewestItem.h"

@implementation SUNewestItem

@synthesize items = myNewestItem;

- (void)setImageURL:(NSURL *)imageURL {
    if(![_imageURL isEqual:imageURL]) {
        _imageURL = imageURL;
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            weakSelf.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:weakSelf.imageURL]];
        });
    }
}

- (NSMutableArray *)items {
    if(myNewestItem == nil) {
        myNewestItem = [[NSMutableArray alloc] init];
    }
    return myNewestItem;    
}

@end
