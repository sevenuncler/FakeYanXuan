//
//  SUBrandManufactoryView.h
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SUItem;
@class SUBrandManufactoryItem;
@interface SUBrandManufactoryView : UIView

@property (nonatomic, strong) NSMutableArray<SUBrandManufactoryItem *> *items;

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context;

@end
