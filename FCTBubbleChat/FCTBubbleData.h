//
//  FCTBubbleData.h
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import <Foundation/Foundation.h>

@import AVFoundation;

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

typedef enum _FCTBubbleDateType {
    bubbleBasicDate = 0,
    bubbleCustomDate1 = 1,
} FCTBubbleDateType;

@interface FCTBubbleData : NSObject

@property (strong) UIView *view;
@property FCTBubbleType type;
@property (strong) UIImage *avatar;
@property (strong) NSDate *date;
@property NSURL *soundPath;

//  Basic init of FCTBubbleData
//  ---
//  Every step will be handled from a simple String / Image / Sound and BubbleType

- (id)initWithMessage:(NSString *)message Date:(NSDate *)date AndType:(FCTBubbleType)type;
- (id)initWithPicture:(UIImage *)picture Date:(NSDate *)date AndType:(FCTBubbleType)type;
- (id)initWithSound:(NSURL *)soundPath Date:(NSDate *)date Type:(FCTBubbleType)type;

//  FCTBubbleData with avatar
//  ---
//  Override the default avatar for a specific cell
//  avatarEnabled property of your FCTTableView should be set to "YES"

- (id)initWithMessage:(NSString *)message Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;
- (id)initWithPicture:(UIImage *)picture Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;
- (id)initWithSound:(NSURL *)soundPath Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;

@end
