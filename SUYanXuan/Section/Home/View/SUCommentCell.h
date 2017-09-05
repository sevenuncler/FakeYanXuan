//
//  SUCommentCell.h
//  SUYanXuan
//
//  Created by He on 2017/9/2.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SUItem;
@class SUCommentItem;
@interface SUCommentCell : UITableViewCell

@property (nonatomic, strong) UIImageView   *avatorImageView;
@property (nonatomic, strong) UILabel       *usernameLabel;
@property (nonatomic, strong) UILabel       *dateLabel;
@property (nonatomic, strong) UITextView    *contentTextView;
@property (nonatomic, copy)   NSArray       *pics;
@property (nonatomic, assign) CGFloat       cellHeight;

@property (nonatomic, strong)  SUCommentItem  *item;
+ (instancetype)viewWithFrame:(CGRect)frame item:(SUItem *)item context:(id)context;



@end
