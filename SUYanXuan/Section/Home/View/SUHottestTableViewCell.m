//
//  SUHottestTableViewCell.m
//  SUYanXuan
//
//  Created by He on 2017/8/28.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUHottestTableViewCell.h"
#import "UIView+Layout.h"

static CGFloat const kPadding = 25.f;
@interface SUHottestTableViewCell()


@end

@implementation SUHottestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.leftImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.descLabel];
    }
    return self;
}

- (UIImageView *)leftImageView {
    if(_leftImageView == nil) {
        _leftImageView = [UIImageView new];
        _leftImageView.frame = CGRectMake(0, 0, self.size.width/2.f, 150.f);
    }
    return _leftImageView;
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(self.leftImageView.right + 15.f, kPadding, self.size.width, 30.f);
        _titleLabel.font = [UIFont systemFontOfSize:14.f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if(_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.frame = CGRectMake(self.titleLabel.left, self.descLabel.botton, self.titleLabel.size.width, 30.f);
        _priceLabel.font = [UIFont systemFontOfSize:12.f];
        _priceLabel.textColor = [UIColor redColor];
    }
    return _priceLabel;
}

- (UILabel *)descLabel {
    if(_descLabel == nil) {
        _descLabel  = [[UILabel alloc] init];
        _descLabel.frame = CGRectMake(self.titleLabel.left, self.titleLabel.botton, 100, 30.f);
        _descLabel.font = [UIFont systemFontOfSize:15.f];
        _descLabel.textColor = [UIColor lightGrayColor];
    }
    return _descLabel;
}

@end
