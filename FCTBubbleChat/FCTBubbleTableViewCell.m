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

@synthesize data = _data;

- (id)init
{
    if (self = [super init]) {
        [self makeCustomCell];
    }
    return self;
}

- (void)makeCustomCell
{
    [self addSubview:_data.label];
}

@end
