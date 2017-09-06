//
//  SUCartGoodsCell.h
//  SUYanXuan
//
//  Created by He on 2017/9/6.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUCartGoodsCell : UITableViewCell

@property (nonatomic, strong) UIButton    *checkImageView;
@property (nonatomic, strong) UIImageView *goodsImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *sizeLabel;
@property (nonatomic, strong) UILabel     *priceLabel;
@property (nonatomic, strong) UILabel     *mountLabel;

@end
