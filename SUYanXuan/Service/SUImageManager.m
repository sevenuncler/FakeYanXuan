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

@end
