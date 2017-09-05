//
//  UIView+Layout.m
//  DreamOneByOne
//
//  Created by He on 2017/7/6.
//  Copyright © 2017年 Sevenuncle. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView(Layout)

- (void)setBotton:(CGFloat)botton {
    CGRect rect = self.frame;
    self.frame = CGRectMake(rect.origin.x, botton - rect.size.height, rect.size.width, rect.size.height);
}

- (CGFloat)botton {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setTop:(CGFloat)top {
    CGRect rect = self.frame;
    self.frame = CGRectMake(rect.origin.x, top, rect.size.width, rect.size.height);
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setLeft:(CGFloat)left {
    CGRect rect = self.frame;
    self.frame = CGRectMake(left, rect.origin.y, rect.size.width, rect.size.height);
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setRight:(CGFloat)right {
    CGRect rect = self.frame;
    self.frame = CGRectMake(right - rect.size.width, rect.origin.y, rect.size.width, rect.size.height);
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    self.frame = CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setPosition:(CGPoint)position {
    CGRect rect = self.frame;
    self.frame = CGRectMake(position.x, position.y, rect.size.width, rect.size.height);
}

- (CGPoint)position {
    CGRect rect = self.frame;
    return CGPointMake(rect.origin.x, rect.origin.y);
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)centerY {
    return self.center.y;
}
@end
