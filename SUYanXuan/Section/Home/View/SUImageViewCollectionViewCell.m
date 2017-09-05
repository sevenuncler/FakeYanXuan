//
//  SUImageViewCollectionViewCell.m
//  SUYanXuan
//
//  Created by He on 2017/9/4.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUImageViewCollectionViewCell.h"
#import "UIView+Layout.h"

@implementation SUImageViewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.contentImageView];
    }
    return self;
}

- (UIImageView *)contentImageView {
    if(_contentImageView == nil) {
        _contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
    }
    return _contentImageView;
}

@end
