//
//  SUCommentCell.m
//  SUYanXuan
//
//  Created by He on 2017/9/2.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUCommentCell.h"
#import "UIView+Layout.h"
#import "SUCommentItem.h"
#import "Macros.h"

static CGFloat const kPadding = 15.f;
@interface SUCommentCell()

@property (nonatomic, strong)  UIView         *imageContainer;
@property (nonatomic, strong)  NSMutableArray *imageViews;

@end

@implementation SUCommentCell

+ (instancetype)viewWithFrame:(CGRect)frame item:(SUItem *)item context:(id)context {
    SUCommentCell *cell = [[SUCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:context];
    cell.item = (SUCommentItem *)item;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.avatorImageView];
        [self.contentView addSubview:self.usernameLabel];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.contentTextView];
        [self.contentView addSubview:self.imageContainer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

#pragma mark - Getter & Setter
- (UIImageView *)avatorImageView {
    if(!_avatorImageView) {
        _avatorImageView = [[UIImageView alloc] init];
        _avatorImageView.frame = CGRectMake(kPadding, kPadding, 30.f, 30.f);
        _avatorImageView.layer.cornerRadius = 15.f;
        _avatorImageView.clipsToBounds = YES;
        _avatorImageView.image = [UIImage imageNamed:@"center.jpeg"];
    }
    return _avatorImageView;
}

- (UILabel *)usernameLabel {
    if(!_usernameLabel) {
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.font = [UIFont systemFontOfSize:11.f];
        _usernameLabel.text = @"张三四";
        _usernameLabel.frame = CGRectMake(self.avatorImageView.right + kPadding/2.f, 0, 100.f, 30.f);
        _usernameLabel.centerY = self.avatorImageView.centerY;
    }
    return _usernameLabel;
}

- (UILabel *)dateLabel {
    if(!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30.f)];
        _dateLabel.font = [UIFont systemFontOfSize:11.f];
        _dateLabel.text = @"2017-09-02 14:20";
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.textColor = [UIColor lightGrayColor];
        _dateLabel.right = self.right;
        _dateLabel.centerY = self.usernameLabel.centerY;
    }
    return _dateLabel;
}

- (UITextView *)contentTextView {
    if(!_contentTextView) {
        _contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(kPadding, self.avatorImageView.botton + kPadding, self.size.width, 20.f)];
        _contentTextView.font = [UIFont systemFontOfSize:14.f];
        _contentTextView.text = @"鞋子做工精致，皮质很好。尺码偏大，平时穿36码，这次换成35码。服务耐心到位";
        _contentTextView.editable = NO;
        _contentTextView.scrollEnabled = NO;
    }
    return _contentTextView;
}

- (UIView *)imageContainer {
    if(!_imageContainer) {
        _imageContainer = [[UIView alloc] initWithFrame:CGRectMake(kPadding, self.contentTextView.botton + kPadding, SCREEN_WIDTH - kPadding*2, 1)];
    }
    return _imageContainer;
}

static CGFloat imageViewWidth = 70.f;
static NSUInteger numOfLine   = 4;

- (NSMutableArray *)imageViews {
    if(!_imageViews) {
        _imageViews = [[NSMutableArray alloc] initWithCapacity:9];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageViewWidth, imageViewWidth)];
        [_imageViews addObject:imageView];
    }
    return _imageViews;
}



- (void)setPics:(NSArray *)pics {
    _pics = pics.copy;
    if(_pics && _pics.count > 0) {
        __weak typeof(self) weakSelf = self;
        [self.imageViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIImageView *iv = (UIImageView *)obj;
            iv.hidden = YES;
        }];
        NSUInteger count = _pics.count;
        [_pics enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(weakSelf.imageViews.count < idx + 1) {
                [weakSelf.imageViews addObject:[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageViewWidth, imageViewWidth)]];
            }
            UIImageView *iv = [self.imageViews objectAtIndex:idx];
            iv.hidden = NO;
            NSUInteger row = idx / numOfLine;
            NSUInteger col = idx % numOfLine;
            iv.top  = kPadding + (imageViewWidth+kPadding)*row;
            iv.left = kPadding + (imageViewWidth+kPadding)*col;
            if(count == idx + 1 ){
                weakSelf.imageContainer.size = CGSizeMake(weakSelf.imageContainer.size.width, iv.botton + kPadding);
            }
            [weakSelf.imageContainer addSubview:iv];
            
            NSURL *imageURL = (NSURL *)obj;
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    iv.image = image;
                });
            });
        }];
    }
}
- (void)setItem:(SUCommentItem *)item {
    _item = item;
    //TODO
    
    self.pics = _item.pics;
    [self.usernameLabel sizeToFit];
    self.usernameLabel.size = CGSizeMake(self.usernameLabel.size.width, 30);
    
    [self.dateLabel sizeToFit];
    self.dateLabel.size = CGSizeMake(self.dateLabel.size.width, 30);
    
    [self.contentTextView sizeToFit];
    self.imageContainer.top = self.contentTextView.botton + kPadding;
}

- (CGFloat)cellHeight {
    _cellHeight = self.imageContainer.botton + kPadding;
    return _cellHeight;
}



@end
