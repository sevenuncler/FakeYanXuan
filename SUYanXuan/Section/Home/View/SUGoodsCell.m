//
//  SUGoodsViewA.m
//  SUYanXuan
//
//  Created by He on 2017/8/27.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUGoodsCell.h"
#import "UIView+Layout.h"
#import "Macros.h"

@interface SUGoodsCell ()

@end

@implementation SUGoodsCell


- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titelLabel];
        [self.contentView addSubview:self.priceLabel];
    }
    return self;
}

- (UIImageView *)imageView {
    if(_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 0, self.size.width, self.size.height*0.618f);
    }
    return _imageView;
}

- (UILabel *)titelLabel {
    if(_titelLabel == nil) {
        _titelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imageView.botton, self.size.width, self.size.height*0.192f)];
        _titelLabel.text = @"商品名称";
        _titelLabel.textAlignment = NSTextAlignmentCenter;
        _titelLabel.font = [UIFont systemFontOfSize:14.f];
        _titelLabel.centerX = self.imageView.centerX;
    }
    return _titelLabel;
}

- (UILabel *)priceLabel {
    if(_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titelLabel.botton, self.size.width, self.size.height*0.192f)];
        _priceLabel.text = @"$999";
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.font = [UIFont systemFontOfSize:15.f];
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.centerX = self.imageView.centerX;
    }
    return _priceLabel;
}

@end
