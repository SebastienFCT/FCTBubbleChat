//
//  FCTBubbleTableViewCell.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleTableViewCell.h"

@interface FCTBubbleTableViewCell ()

@end

@implementation FCTBubbleTableViewCell {
    UIView *background;
    UIView *adaptedView;
}

#pragma mark - cell init

- (id)init
{
    if (self = [super init]) {
        // init method here
    }
    return self;
}

- (id)initWithData:(FCTBubbleData *)data
{
    if (self = [super init]) {
        [self makeCustomViewWithData:data];
    }
    return self;
}

- (void)makeCustomViewWithData:(FCTBubbleData *)data
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    FCTBubbleType type = data.type;
    
    [adaptedView removeFromSuperview];
    adaptedView = data.label;

    if (type == BubbleFromSomeone) {
        background = [[UIView alloc] initWithFrame:CGRectMake(5, 5, data.label.frame.size.width + 10, data.label.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(10, 10, data.label.frame.size.width, data.label.frame.size.height);
    } else if (type == BubbleFromMe) {
        background = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - data.label.frame.size.width - 15, 5, data.label.frame.size.width + 10, data.label.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(self.frame.size.width - data.label.frame.size.width - 10, 10, data.label.frame.size.width, data.label.frame.size.height);
    } else {
        background = [[UIView alloc] initWithFrame:CGRectMake(5, 5, data.label.frame.size.width + 10, data.label.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(10, 10, data.label.frame.size.width, data.label.frame.size.height);
    }
    
    [background.layer setCornerRadius:8.0f];
    [background.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [background.layer setBorderWidth:1.0];
    
    [self addSubview:background];
    [self addSubview:adaptedView];
}

@end
