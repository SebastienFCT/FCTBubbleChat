//
//  FCTBubbleData.h
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _FCTBubbleType {
    BubbleFromMe = 0,
    BubbleFromSomeone = 1,
    BubbleFromServer = 2
} FCTBubbleType;

@interface FCTBubbleData : NSObject

@property (strong) UIView *view;
@property FCTBubbleType type;
@property (strong) UIImage *avatar;

//  Basic init of FCTBubbleData
//  ---
//  Every step will be handled from a simple NSString and BubbleType

- (id)initWithMessage:(NSString *)message AndType:(FCTBubbleType)type;
- (id)initWithPicture:(UIImage *)picture AndType:(FCTBubbleType)type;
- (id)initWithMessage:(NSString *)message AndType:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;

@end
