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

typedef enum _FCTAvatarType {
    basicAvatar = 0,
    squarreAvatar = 1,
    circleAvatar = 2,
    banneAvatar = 3
} FCTAvatarType;

@interface FCTBubbleData : NSObject

@property (strong) UIView *view;
@property FCTBubbleType type;
@property (strong) UIImage *avatar;
@property (strong) NSDate *date;

//  Basic init of FCTBubbleData
//  ---
//  Every step will be handled from a simple NSString / UIImage and BubbleType

- (id)initWithMessage:(NSString *)message Date:(NSDate *)date AndType:(FCTBubbleType)type;
- (id)initWithPicture:(UIImage *)picture Date:(NSDate *)date AndType:(FCTBubbleType)type;

//  FCTBubbleData with avatar
//  ---
//  Override the default avatar for a specific cell
//  avatarEnabled property of FCTTableView should be set to "YES"

- (id)initWithMessage:(NSString *)message Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;
- (id)initWithPicture:(UIImage *)picture Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;

@end
