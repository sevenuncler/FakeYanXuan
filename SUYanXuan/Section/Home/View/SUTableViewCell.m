//
//  SUTableViewCell.m
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUTableViewCell.h"

@implementation SUTableViewCell

- (void)setMyContentView:(UIView *)myContentView {
    if(_myContentView) {
        [_myContentView removeFromSuperview];
    }
    _myContentView = myContentView;
    [self.contentView addSubview:_myContentView];
}

@end
