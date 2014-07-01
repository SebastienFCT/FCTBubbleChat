//
//  FCTBubbleData.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleData.h"

@implementation FCTBubbleData

@synthesize date = _date;
@synthesize view = _view;
@synthesize edgeInsets = _edgeInsets;
@synthesize type = _type;
@synthesize avatar = _avatar;

+ (id)bubbleWithText:(NSString *)text date:(NSDate *)date type:(FCTBubbleType)type
{
    return [[FCTBubbleData alloc] initWithText:text date:date type:type];
}

- (id)initWithText:(NSString *)text date:(NSDate *)date type:(FCTBubbleType)type
{
    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:(text ? text : @"") attributes:@{NSFontAttributeName: font}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){220, 10000} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize size = rect.size;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = (text ? text : @"");
    label.font = font;
    label.backgroundColor = [UIColor clearColor];
    
    UIEdgeInsets insets = {5, 10, 11, 17};
    return [self initWithView:label date:date type:type insets:insets];
}

- (id)initWithView:(UIView *)view date:(NSDate *)date type:(FCTBubbleType)type insets:(UIEdgeInsets)edgeInsets
{
    if (self = [super init]) {
        _view = view;
        _date = date;
        _type = type;
        _edgeInsets = edgeInsets;
    }
    return self;
}

@end
