//
//  FCTBubbleTableView.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/2/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleTableView.h"

@interface FCTBubbleTableView ()

@end

@implementation FCTBubbleTableView

@synthesize bubbleDataSource = _bubbleDataSource;

#pragma mark - Init

- (id)init
{
    if (self = [super init]) {
        // init
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        // init
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // init
    }
    return self;
}

#pragma mark - UITableViewDataSource implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
