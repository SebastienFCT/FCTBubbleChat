//
//  FCTBubbleData.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleData.h"

@implementation FCTBubbleData

@synthesize message = _message;
@synthesize bubble = _bubble;

- (id)initWithMessage:(NSString *)message
{
    if (self = [super init]) {
        self.message = message;
        
        UIFont *font = [UIFont fontWithName:@"Arial" size:16];
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:(message ? message : @"") attributes:@{NSFontAttributeName: font}];
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){220, 10000} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        CGSize size = rect.size;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.text = (message ? message : @"");
        label.font = font;
        label.backgroundColor = [UIColor clearColor];
        [label.layer setCornerRadius:8.0f];
        [label.layer setBorderWidth:1.0];
        [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        
        self.bubble = label;
    }
    return self;
}

@end
