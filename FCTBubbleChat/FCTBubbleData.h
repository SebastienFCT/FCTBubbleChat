//
//  FCTBubbleData.h
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _FCTBubbleType {
    meBubble = 0,
    otherBubble = 1,
    groupAndMeBubble = 2,
    otherGroupBubble = 3
} FCTBubbleType;

@interface FCTBubbleData : NSObject

@property (readonly, strong) NSDate *date;
@property (readonly, strong) UIView *view;
@property (readonly) UIEdgeInsets edgeInsets;
@property (readonly) FCTBubbleType type;
@property (strong) UIImage *avatar;

+ (id)bubbleWithText:(NSString *)text date:(NSDate *)date type:(FCTBubbleType)type;

@end
