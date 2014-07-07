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

- (id)initWithLabel:(UILabel *)label
{
    if (self = [super init]) {
        self.label = label;
    }
    return self;
}

@end
