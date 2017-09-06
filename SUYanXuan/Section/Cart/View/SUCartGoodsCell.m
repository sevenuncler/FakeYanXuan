//
//  SUCartGoodsCell.m
//  SUYanXuan
//
//  Created by He on 2017/9/6.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUCartGoodsCell.h"
#import "UIView+Layout.h"

static CGFloat kPadding = 15.f;
static CGFloat kWidth = 20.f;
@implementation SUCartGoodsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.checkImageView];
        [self.contentView addSubview:self.goodsImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.sizeLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.mountLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.checkImageView.frame = CGRectMake(kPadding, self.centerY, kWidth, kWidth);
    self.checkImageView.centerY = self.size.height / 2;
    self.goodsImageView.frame = CGRectMake(self.checkImageView.right + kPadding, 0, self.size.height - 2*kPadding, self.size.height - 2*kPadding);
    self.goodsImageView.centerY = self.size.height / 2;
    self.titleLabel.frame     = CGRectMake(self.goodsImageView.right + kPadding, kPadding, 150.f, 20.f);
    self.sizeLabel.frame      = CGRectMake(self.goodsImageView.right + kPadding, self.titleLabel.botton, 150.f, 18.f);
    self.priceLabel.frame     = CGRectMake(self.goodsImageView.right + kPadding, self.goodsImageView.botton - 20.f, 150.f, 20.f);
    self.mountLabel.frame     = CGRectMake(self.size.width - kWidth- kPadding, kPadding, kWidth, kWidth);
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return [super hitTest:point withEvent:event];
}
#pragma mark - 事件响应
- (void)onCheckAction:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

#pragma mark - Getter & Setter
- (UIButton *)checkImageView {
    if(!_checkImageView) {
        _checkImageView = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkImageView.userInteractionEnabled = YES;
        [_checkImageView addTarget:self action:@selector(onCheckAction:) forControlEvents:UIControlEventTouchUpInside];
        [_checkImageView setImage:[UIImage imageNamed:@"圆圈"] forState:UIControlStateNormal];
        [_checkImageView setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateSelected];
    }
    return _checkImageView;
}

- (UIImageView *)goodsImageView {
    if(!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 40, 40)];
    }
    return _goodsImageView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"商品名称";
        _titleLabel.font = [UIFont systemFontOfSize:14.f];
    }
    return _titleLabel;
}

- (UILabel *)sizeLabel {
    if(!_sizeLabel) {
        _sizeLabel = [[UILabel alloc] init];
        _sizeLabel.text = @"商品规格1;商品规格2";
        _sizeLabel.font = [UIFont systemFontOfSize:12.f];
        _sizeLabel.textColor = [UIColor colorWithWhite:0.5f alpha:1];

    }
    return _sizeLabel;
}

- (UILabel *)priceLabel {
    if(!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.text = @"$99.00";
        _priceLabel.font = [UIFont systemFontOfSize:15.f];
    }
    return _priceLabel;
}

- (UILabel *)mountLabel {
    if(!_mountLabel) {
        _mountLabel = [[UILabel alloc] init];
        _mountLabel.text = @"x9";
        _mountLabel.font = [UIFont systemFontOfSize:13.f];
    }
    return _mountLabel;
}

@end
