//
//  SUThemeViewA.h
//  SUYanXuan
//
//  Created by He on 2017/9/10.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUThemeItem.h"

@interface SUThemeViewA : UICollectionView

@property (nonatomic, assign) CGSize        itemSize;
@property (nonatomic, strong) SUThemeItem   *item;

+ (instancetype)initWithFrame:(CGRect)frame itemSize:(CGSize) size item:(SUThemeItem *)item;

@end
