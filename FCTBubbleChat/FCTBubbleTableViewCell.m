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

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
	[self makeTheCell];
}

- (void)makeTheCell
{
    [self.customView removeFromSuperview];
    
    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 100, 50)];
    test.text = @"blablablablabla";
    
    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:(test.text ? test.text : @"") attributes:@{NSFontAttributeName: font}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){220, 10000} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize size = rect.size;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = (test.text ? test.text : @"");
    label.font = font;
    label.backgroundColor = [UIColor clearColor];
    [label.layer setCornerRadius:8.0f];
    [label.layer setBorderWidth:1.0];
    [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];

    self.customView = label;
    
    [self.contentView addSubview:self.customView];
}

@end
