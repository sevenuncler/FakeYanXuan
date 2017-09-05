//
//  SUGoodsViewA.h
//  SUYanXuan
//
//  Created by He on 2017/8/27.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SUItem;
@interface SUGoodsViewCell : UICollectionViewCell

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context;

@end
