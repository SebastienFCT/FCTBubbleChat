//
//  FCTBubbleData.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleData.h"

@implementation FCTBubbleData

@synthesize label = _label;

- (id)initWithMessage:(NSString *)message
{
    if (self = [super init]) {
        /* Detect the good size for the message */
        UIFont *font = [UIFont fontWithName:@"Arial" size:16];
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:(message ? message : @"") attributes:@{NSFontAttributeName: font}];
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){260, 10000} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        /* Draw the label */
        CGSize size = rect.size;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.text = (message ? message : @"");
        label.font = font;
        label.backgroundColor = [UIColor lightGrayColor];
        
        self.label = label;
    }
    return self;
}

@end
