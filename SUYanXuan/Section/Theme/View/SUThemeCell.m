//
//  SUThemeCell.m
//  SUYanXuan
//
//  Created by He on 2017/9/8.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUThemeCell.h"
#import "UIView+Layout.h"

static CGFloat const kSpace = 10.f;
@implementation SUThemeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.themeImageView];
        [self.contentView addSubview:self.themeTitleLabel];
        [self.contentView addSubview:self.themeSubTitleLabel];
        [self.contentView addSubview:self.themePriceLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.themeImageView.frame = CGRectMake(0, 0, self.size.width, self.size.height*0.618f);
    
    [self.themeTitleLabel sizeToFit];
    self.themeTitleLabel.top = self.themeImageView.botton + kSpace*2;
    self.themeTitleLabel.centerX = self.themeImageView.centerX;
    
    [self.themeSubTitleLabel sizeToFit];
    self.themeSubTitleLabel.top = self.themeTitleLabel.botton + kSpace/2;
    self.themeSubTitleLabel.centerX = self.themeImageView.centerX;
    
    [self.themePriceLabel sizeToFit];
    self.themePriceLabel.top = self.themeSubTitleLabel.botton + kSpace;
    self.themePriceLabel.centerX = self.themeImageView.centerX;
}

#pragma mark - Getter & Setter
- (UIImageView *)themeImageView {
    if(!_themeImageView) {
        _themeImageView = [[UIImageView alloc] init];
    }
    return _themeImageView;
}

- (UILabel *)themeTitleLabel {
    if(!_themeTitleLabel) {
        _themeTitleLabel = [[UILabel alloc] init];
        _themeTitleLabel.font = [UIFont systemFontOfSize:17.f];
        _themeTitleLabel.text = @"一半的价格，满分的品质";
        _themeSubTitleLabel.textColor = [UIColor blackColor];
    }
    return _themeTitleLabel;
}

- (UILabel *)themeSubTitleLabel {
    if(!_themeSubTitleLabel) {
        _themeSubTitleLabel = [[UILabel alloc] init];
        _themeSubTitleLabel.font = [UIFont systemFontOfSize:11.f];
        _themeSubTitleLabel.textColor = [UIColor lightGrayColor];
        _themeSubTitleLabel.text = @"\"舒适百搭，清爽一身\"";
    }
    return _themeSubTitleLabel;
}

- (UILabel *)themePriceLabel {
    if(!_themePriceLabel) {
        _themePriceLabel = [[UILabel alloc] init];
        _themePriceLabel.font = [UIFont systemFontOfSize:15.f];
        _themePriceLabel.textColor = [UIColor redColor];
        _themePriceLabel.text = @"99元起";
    }
    return _themePriceLabel;
}


@end
