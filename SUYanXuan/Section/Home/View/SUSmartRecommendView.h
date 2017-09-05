//
//  SUSmartRecommendView.h
//  SUYanXuan
//
//  Created by He on 2017/8/30.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SUItem;
@interface SUSmartRecommendView : UICollectionView

@property (nonatomic, strong) NSMutableArray *items;

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context;

- (void)handle:(id)sender;
@end
