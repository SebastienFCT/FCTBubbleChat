//
//  FCTBubbleData.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleData.h"

@implementation FCTBubbleData

@synthesize view = _view;
@synthesize avatar = _avatar;

- (id)initWithMessage:(NSString *)message AndType:(FCTBubbleType)type
{
    if (self = [super init]) {
        /* Detect the good size for the message */
        UIFont *font = [UIFont fontWithName:@"Arial" size:16];
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:(message ? message : @"") attributes:@{NSFontAttributeName: font}];
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){210, 10000} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        CGSize size = rect.size;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.text = (message ? message : @"");
        label.font = font;
        
        self.view = label;
        self.type = type;
        self.avatar = nil;
    }
    return self;
}

- (id)initWithMessage:(NSString *)message AndType:(FCTBubbleType)type AndAvatar:(UIImage *)avatar
{
    
    if (self = [super init]) {
        /* Detect the good size for the message */
        UIFont *font = [UIFont fontWithName:@"Arial" size:16];
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:(message ? message : @"") attributes:@{NSFontAttributeName: font}];
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){210, 10000} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        CGSize size = rect.size;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.text = (message ? message : @"");
        label.font = font;
        
        self.view = label;
        self.type = type;
        self.avatar = avatar;
    }
    return self;
}

- (id)initWithPicture:(UIImage *)picture AndType:(FCTBubbleType)type
{
    if (self = [super init]) {
        UIImageView *canvas = [[UIImageView alloc] init];
        if (picture.size.width > 210) {
            canvas.frame = CGRectMake(0, 0, 210, picture.size.height / (picture.size.width / 210));
        } else {
            canvas.frame = CGRectMake(0, 0, picture.size.width, picture.size.height);
        }
        canvas.image = picture;
        self.view = canvas;
        self.type = type;
        self.avatar = nil;
    }
    return self;
}

@end
