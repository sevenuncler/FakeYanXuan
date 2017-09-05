//
//  SUCollectionViewCell.m
//  SUYanXuan
//
//  Created by He on 2017/8/25.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUCollectionViewCell.h"

@implementation SUCollectionViewCell

- (void)setMyContentView:(UIView *)myContentView {
    if(_myContentView) {
        [_myContentView removeFromSuperview];
    }
    _myContentView = myContentView;
    [self.contentView addSubview:myContentView];
}

@end
