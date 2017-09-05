//
//  SUCommentItem.h
//  SUYanXuan
//
//  Created by He on 2017/9/2.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "SUItem.h"

@interface SUCommentItem : SUItem

@property (nonatomic, strong) NSURL     *avatorURL;
@property (nonatomic, copy)   NSString  *username;
@property (nonatomic, strong) NSDate    *date;
@property (nonatomic, copy)   NSString  *content;
@property (nonatomic, copy)   NSArray   *pics;

@end
