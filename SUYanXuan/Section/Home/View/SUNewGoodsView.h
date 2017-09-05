//
//  SUNewGoodsView.h
//  SUYanXuan
//
//  Created by He on 2017/8/27.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUItem.h"


typedef void (^didSelectedHandler)(SUItem *, CGRect);
@interface SUNewGoodsView : UICollectionView

@property (nonatomic, copy) didSelectedHandler selectedHandler;

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context;

@end
