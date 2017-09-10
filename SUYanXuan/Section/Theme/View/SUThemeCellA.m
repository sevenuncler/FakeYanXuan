//
//  SUThemeCellA.m
//  SUYanXuan
//
//  Created by He on 2017/9/10.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUThemeCellA.h"

@implementation SUThemeCellA

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLabel];
        self.backgroundColor = [UIColor colorWithWhite:0.96f alpha:1];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = self.frame.size;
    self.imageView.frame = CGRectMake(0, 0, size.width, size.height);
    
    [self.titleLabel sizeToFit];
    self.titleLabel.center = self.imageView.center;
}

#pragma mark - Getter & Setter
- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel      = [UILabel new];
        _titleLabel.text = @"丁磊私物推荐";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font  = [UIFont systemFontOfSize:14.f];
    }
    return _titleLabel;
}

@end
