//
//  SUGeneralAutoScrollView.h
//  SUYanXuan
//
//  Created by He on 2017/9/1.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SUItem;
@interface SUGeneralAutoScrollView : UICollectionView

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context;

@end
