//
//  SUBrandManufactoryView.m
//  SUYanXuan
//
//  Created by He on 2017/8/26.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUBrandManufactoryView.h"
#import "SUBrandManufactoryItem.h"
#import "UIView+Layout.h"

@interface SUBrandManufactoryView()

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;

@end

@implementation SUBrandManufactoryView

+ (instancetype)viewWithFrame:(CGRect )frame item:(SUItem *)item context:(id)context {
    SUBrandManufactoryView *view = [[SUBrandManufactoryView alloc] initWithFrame:frame];
    SUBrandManufactoryItem *brandItem = (SUBrandManufactoryItem *)item;
    view.items = brandItem.items;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self addSubview:self.imageView1];
        [self addSubview:self.imageView2];
        [self addSubview:self.imageView3];
    }
    return self;
}

//- (void)drawRect:(CGRect)rect {
//    SUBrandManufactoryItem *item1 = [self.items objectAtIndex:0];
//    if(item1) {
//        self.imageView1.image = item1.image;
//    }
//    
//    SUBrandManufactoryItem *item2 = [self.items objectAtIndex:1];
//    if(item2) {
//        self.imageView2.image = item2.image;
//    }
//    
//    SUBrandManufactoryItem *item3 = [self.items objectAtIndex:2];
//    if(item3) {
//        self.imageView3.image = item3.image;
//    }
//}

#pragma mark - Getter & Setter 
- (UIImageView *)imageView1 {
    if(_imageView1 == nil) {
        _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.size.width/2.f, self.size.height)];
        _imageView1.backgroundColor = [UIColor redColor];
    }
    return _imageView1;
}

- (UIImageView *)imageView2 {
    if(_imageView2 == nil) {
        _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.size.width/2.f, 0, self.size.width/2.f, self.size.height/2.f)];
        _imageView2.backgroundColor = [UIColor blueColor];
    }
    return _imageView2;
}

- (UIImageView *)imageView3 {
    if(_imageView3 == nil) {
        _imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.size.width/2.f, self.size.height/2.f, self.size.width/2.f, self.size.height/2.f)];
        _imageView3.backgroundColor = [UIColor greenColor];
    }
    return _imageView3;
}

- (void)setItems:(NSMutableArray *)items {
    _items = items;
    {
        SUBrandManufactoryItem *item = [self.items objectAtIndex:0];
        __weak typeof(self) weakSelf = self;
        __weak typeof(SUBrandManufactoryItem *) weakItem = item;
        dispatch_barrier_async(item.imageDownloadQueue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.imageView1.image = weakItem.image;
            });
        });
    }
    {
        SUBrandManufactoryItem *item = [self.items objectAtIndex:1];
        __weak typeof(self) weakSelf = self;
        __weak typeof(SUBrandManufactoryItem *) weakItem = item;
        dispatch_barrier_async(item.imageDownloadQueue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.imageView2.image = weakItem.image;
            });
        });
    }
    {
        SUBrandManufactoryItem *item = [self.items objectAtIndex:2];
        __weak typeof(self) weakSelf = self;
        __weak typeof(SUBrandManufactoryItem *) weakItem = item;
        dispatch_barrier_async(item.imageDownloadQueue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.imageView3.image = weakItem.image;
            });
        });
    }
}

@end
