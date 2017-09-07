//
//  SUBasicProfileView.m
//  SUYanXuan
//
//  Created by He on 2017/9/7.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUBasicProfileView.h"
#import "UIView+Layout.h"

static CGFloat kPadding = 15.f;
static CGFloat kWidth   = 25.f;
static CGFloat kRate    = 1.8f;
@interface SUBasicProfileView()



@end

@implementation SUBasicProfileView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews {
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"待付款"];
        imageView.frame = CGRectMake(kPadding, kPadding, kWidth, kWidth);
        
        UILabel *label  = [[UILabel alloc] init];
        label.font      = [UIFont systemFontOfSize:9.f];
        label.text      = @"待付款";
        [label sizeToFit];
        label.centerX   = imageView.centerX;
        label.top       = imageView.botton;
        [self addSubview:imageView];
        [self addSubview:label];
    }
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"待发货"];
        imageView.frame = CGRectMake(kPadding + 1*(kWidth+kPadding)*kRate, kPadding, kWidth, kWidth);
        
        UILabel *label  = [[UILabel alloc] init];
        label.font      = [UIFont systemFontOfSize:9.f];
        label.text      = @"待发货";
        [label sizeToFit];
        label.centerX   = imageView.centerX;
        label.top       = imageView.botton;
        [self addSubview:imageView];
        [self addSubview:label];
    }
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"已发货"];
        imageView.frame = CGRectMake(kPadding + 2*(kWidth+kPadding)*kRate, kPadding, kWidth, kWidth);
        
        UILabel *label  = [[UILabel alloc] init];
        label.font      = [UIFont systemFontOfSize:9.f];
        label.text      = @"已发货";
        [label sizeToFit];
        label.centerX   = imageView.centerX;
        label.top       = imageView.botton;
        [self addSubview:imageView];
        [self addSubview:label];
    }
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"待评价"];
        imageView.frame = CGRectMake(kPadding + 3*(kWidth+kPadding)*kRate, kPadding, kWidth, kWidth);
        
        UILabel *label  = [[UILabel alloc] init];
        label.font      = [UIFont systemFontOfSize:9.f];
        label.text      = @"待评价";
        [label sizeToFit];
        label.centerX   = imageView.centerX;
        label.top       = imageView.botton;
        [self addSubview:imageView];
        [self addSubview:label];
    }
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"售后服务"];
        imageView.frame = CGRectMake(kPadding + 4*(kWidth+kPadding)*kRate, kPadding, kWidth, kWidth);
        
        UILabel *label  = [[UILabel alloc] init];
        label.font      = [UIFont systemFontOfSize:9.f];
        label.text      = @"售后服务";
        [label sizeToFit];
        label.centerX   = imageView.centerX;
        label.top       = imageView.botton;
        [self addSubview:imageView];
        [self addSubview:label];
    }
}

@end
