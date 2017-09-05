//
//  SUHottestView.h
//  SUYanXuan
//
//  Created by He on 2017/8/28.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SUItem;
@interface SUHottestView : UITableView
@property (nonatomic, strong) NSMutableArray<SUItem *> *items;

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context;

@end
