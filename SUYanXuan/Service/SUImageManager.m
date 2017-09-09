//
//  SUImageManager.m
//  SUYanXuan
//
//  Created by He on 2017/9/4.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUImageManager.h"

@implementation SUImageManager

+ (instancetype)defaultImageManager {
    static SUImageManager *imageManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageManager = [[SUImageManager alloc] init];
    });
    return imageManager;
}

- (void)setImageView:(UIImageView *)imageView withUrl:(NSString *)url {
    if([self objectForKey:url]) {
        imageView.image = [self objectForKey:url];
    }else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
            [self setObject:image forKey:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = image;
            });
        });

    }
}
@end
