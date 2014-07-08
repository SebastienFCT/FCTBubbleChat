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
    self.backgroundColor = [UIColor clearColor];
    FCTBubbleType type = data.type;
    
    [adaptedView removeFromSuperview];
    adaptedView = data.label;

    if (type == BubbleFromSomeone) {
        background = [[UIView alloc] initWithFrame:CGRectMake(10, 5, data.label.frame.size.width + 10, data.label.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(15, 10, data.label.frame.size.width, data.label.frame.size.height);
    } else if (type == BubbleFromMe) {
        background = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - data.label.frame.size.width - 20, 5, data.label.frame.size.width + 10, data.label.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(self.frame.size.width - data.label.frame.size.width - 15, 10, data.label.frame.size.width, data.label.frame.size.height);
    } else {
        background = [[UIView alloc] initWithFrame:CGRectMake(5, 5, data.label.frame.size.width + 10, data.label.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(10, 10, data.label.frame.size.width, data.label.frame.size.height);
    }
    
    [self addSubview:background];
    [self addSubview:adaptedView];
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Base shape
    CGRect activeBounds = background.frame;
    CGFloat cornerRadius = 10.0f;
    CGFloat originX = activeBounds.origin.x;
    CGFloat originY = activeBounds.origin.y;
    CGFloat width = activeBounds.size.width;
    CGFloat height = activeBounds.size.height;
    
    CGRect bPathFrame = CGRectMake(originX, originY, width, height);
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:bPathFrame cornerRadius:cornerRadius].CGPath;
    
    // Fill and Outerdrop shadow
    CGContextAddPath(context, path);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0f].CGColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.5f), 2.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
}

@end
