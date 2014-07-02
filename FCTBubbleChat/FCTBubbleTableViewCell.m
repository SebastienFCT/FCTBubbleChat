//
//  FCTBubbleTableViewCell.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleTableViewCell.h"

@interface FCTBubbleTableViewCell ()

@property (retain) UIView *customView;

- (void)makeTheCell;

@end

@implementation FCTBubbleTableViewCell

@synthesize data = _data;

- (void)makeTheCell
{
    [self.customView removeFromSuperview];
    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 100, 50)];
    test.text = @"blablablablabla";
    self.customView = test;
    
    [self.contentView addSubview:self.customView];
}

@end
