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

- (id)initWithMessage:(NSString *)message
{
    if (self = [super init]) {
        self.message = message;
    }
    return self;
}

@end
