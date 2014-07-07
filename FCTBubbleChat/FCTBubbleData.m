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
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        label.text = message;
        self.label = label;
    }
    return self;
}

@end
