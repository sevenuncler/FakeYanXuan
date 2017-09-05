//
//  SUGoodsDetailImageView.h
//  SUYanXuan
//
//  Created by He on 2017/9/4.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SUItem;
@interface SUGoodsDetailImageView : UIScrollView

@property (nonatomic, copy) NSArray *pictures;

+ (instancetype)viewWithFrame:(CGRect)frame withItem:(SUItem *)item context:(id)context;


@end
