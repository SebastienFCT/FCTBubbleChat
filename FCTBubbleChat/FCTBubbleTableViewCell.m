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

@end

@implementation FCTBubbleTableViewCell

- (id)initWithCustomView:(UILabel *)view
{
    if (self = [super init]) {
        [self makeCustomCell];
    }
    return self;
}

- (void)makeCustomCell
{
    // Init the cell here
}

@end
