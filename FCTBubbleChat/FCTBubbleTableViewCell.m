//
//  FCTBubbleTableViewCell.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleTableViewCell.h"

@interface FCTBubbleTableViewCell ()

@end

@implementation FCTBubbleTableViewCell {
    UIView *background;
    UIView *adaptedView;
    FCTBubbleType type;
    BOOL _avatarEnabled;
    UIImage *_avatar;
    FCTAvatarType _avatarStyle;
    SystemSoundID sound;
    NSURL *soundPath;
    AVAudioSession *audioSession;
    AVAudioPlayer *soundMusicPlayer;
}

#pragma mark - cell init

- (id)init
{
    if (self = [super init]) {
        // init method here
    }
    return self;
}

- (id)initWithData:(FCTBubbleData *)data AvatarEnabled:(BOOL)avatarEnabled WithStyle:(FCTAvatarType)avatarStyle
{
    if (self = [super init]) {
        _avatarEnabled = (avatarEnabled ? avatarEnabled : NO);
        _avatarStyle = avatarStyle;
        [self makeCustomViewWithData:data];
    }
    return self;
}

- (void)makeCustomViewWithData:(FCTBubbleData *)data
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    type = data.type;
    
    [adaptedView removeFromSuperview];
    if ([data.view isKindOfClass:[UIButton class]]) {
        soundPath = data.soundPath;
        [self configureAudioPlayer];
        UIButton *btn = (UIButton *)data.view;
        [btn addTarget:self action:@selector(PlayMusic) forControlEvents:UIControlEventTouchUpInside];
        adaptedView = btn;
    } else {
        adaptedView = data.view;
    }
    
    int avatarSpace;
    avatarSpace = (_avatarEnabled ? 45 : 0);
    if (data.avatar == nil) {
        _avatar = [UIImage imageNamed:@"fctbc_ic_default_user.png"];
    } else {
        _avatar = data.avatar;
    }

    if (type == BubbleFromSomeone) {
        background = [[UIView alloc] initWithFrame:CGRectMake(15 + avatarSpace, 5, data.view.frame.size.width + 10, data.view.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(20 + avatarSpace, 10, data.view.frame.size.width, data.view.frame.size.height);
        [self setAvatarWithFrame:CGRectMake(5, 5, 40, 40)];
    } else if (type == BubbleFromMe) {
        background = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - data.view.frame.size.width - 25 - avatarSpace, 5, data.view.frame.size.width + 10, data.view.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(self.frame.size.width - data.view.frame.size.width - 20 - avatarSpace, 10, data.view.frame.size.width, data.view.frame.size.height);
        [self setAvatarWithFrame:CGRectMake(self.frame.size.width - 45, 5, 40, 40)];
    } else {
        background = [[UIView alloc] initWithFrame:CGRectMake(5, 5, data.view.frame.size.width + 10, data.view.frame.size.height + 10)];
        adaptedView.frame = CGRectMake(10, 10, data.view.frame.size.width, data.view.frame.size.height);
    }
    
    [self addSubview:background];
    [self addSubview:adaptedView];
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect activeBounds = background.frame;
    CGFloat cornerRadius = 3.0f;
    CGFloat originX = activeBounds.origin.x;
    CGFloat originY = activeBounds.origin.y;
    CGFloat width = activeBounds.size.width;
    CGFloat height = activeBounds.size.height;
    
    CGRect bPathFrame = CGRectMake(originX, originY, width, height);
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:bPathFrame cornerRadius:cornerRadius].CGPath;
    
    CGPoint pt1, pt2, pt3;
    
    if (type == BubbleFromMe) {
        pt1 = CGPointMake(originX + width, originY + 5);
        pt2 = CGPointMake(originX + width + 8, originY + 10);
        pt3 = CGPointMake(originX + width, originY + 15);
    } else if(type == BubbleFromSomeone) {
        pt1 = CGPointMake(originX, originY + 5);
        pt2 = CGPointMake(originX - 8, originY + 10);
        pt3 = CGPointMake(originX, originY + 15);
    }
    
    CGPoint vertices[] = {pt1, pt2, pt3, pt1};
    
    CGContextBeginPath(context);
    CGContextAddLines(context, vertices, 3);
    
    CGContextAddPath(context, path);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0f].CGColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 2.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
}

- (void)setAvatarWithFrame:(CGRect)frame
{
    if (_avatarEnabled) {
        UIImageView *avatar = [[UIImageView alloc] initWithFrame:frame];
        avatar.image = _avatar;
        [self addSubview:avatar];
        
        if (_avatarStyle == circleAvatar) {
            [avatar.layer setCornerRadius:frame.size.width / 2];
            [avatar.layer setBorderColor:[UIColor whiteColor].CGColor];
            [avatar.layer setBorderWidth:1.0f];
            avatar.layer.masksToBounds = YES;
        } else if (_avatarStyle == squarreAvatar) {
            [avatar.layer setBorderColor:[UIColor whiteColor].CGColor];
            [avatar.layer setBorderWidth:1.0f];
            avatar.layer.masksToBounds = YES;
        }
    }
}

- (void)configureAudioPlayer {
    soundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundPath error:nil];
    soundMusicPlayer.delegate = self;
    soundMusicPlayer.numberOfLoops = 0;
    [soundMusicPlayer prepareToPlay];
}

- (void)PlayMusic {
	if ([audioSession isOtherAudioPlaying]) {
        return;
    }
    
    [soundMusicPlayer play];
}

#pragma mark: AVAudioPlayerDelegate methods

- (void) audioPlayerBeginInterruption: (AVAudioPlayer *) player {
    
}

- (void) audioPlayerEndInterruption: (AVAudioPlayer *) player withOptions:(NSUInteger) flags{
    
}

@end
