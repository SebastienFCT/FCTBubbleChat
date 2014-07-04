//
//  FCTBubbleData.h
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCTBubbleData : NSObject

@property (strong) NSString *message;
@property (strong) UILabel *bubble;

- (id)initWithMessage:(NSString *)message;

@end
