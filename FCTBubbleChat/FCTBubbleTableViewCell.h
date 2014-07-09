//
//  FCTBubbleTableViewCell.h
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FCTBubbleData.h"

@interface FCTBubbleTableViewCell : UITableViewCell

- (id)initWithData:(FCTBubbleData *)data AvatarEnabled:(BOOL)avatarEnabled WithStyle:(FCTAvatarType)avatarStyle;

@end
