//
//  SUCollectionViewCellA.m
//  SUYanXuan
//
//  Created by He on 2017/9/5.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUCollectionViewCellA.h"
#import "UIView+Layout.h"

@implementation SUCollectionViewCellA

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.myImageView];
        [self.contentView addSubview:self.myLabel];
    }
    return self;
}

- (UIImageView *)myImageView {
    if(!_myImageView) {
        _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.width)];
    }
    return _myImageView;
}

- (UILabel *)myLabel {
    if(!_myLabel) {
        _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.myImageView.botton, self.size.width, self.size.height - self.myImageView.size.height)];
        _myLabel.textAlignment = NSTextAlignmentCenter;
        _myLabel.font = [UIFont systemFontOfSize:9.f];
    }
    return _myLabel;
}


@end
