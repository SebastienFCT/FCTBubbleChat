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

@implementation FCTBubbleTableView {
    NSMutableArray *bubbleData;
}

@synthesize bubbleDataSource = _bubbleDataSource;
@synthesize avatarEnabled = _avatarEnabled;

#pragma mark - Init

- (id)init
{
    if (self = [super init]) {
        [self initialSteps];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialSteps];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialSteps];
    }
    return self;
}

- (void)initialSteps
{
    self.delegate = self;
    self.dataSource = self;
    
    // Default values
    _avatarEnabled = NO;
}

#pragma mark - reload data

- (void)reloadData
{
    /* Customize the tableView */
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.showsVerticalScrollIndicator = NO;
    
    /* Setup the required data */
    bubbleData = [[NSMutableArray alloc] initWithCapacity:[self.bubbleDataSource numberOfRowForTableView:self]];
    
    if (self.bubbleDataSource && [self.bubbleDataSource numberOfRowForTableView:self] > 0) {
        for (int i = 0; i < [self.bubbleDataSource numberOfRowForTableView:self]; i++) {
            FCTBubbleData *singleData = [self.bubbleDataSource tableView:self dataForRow:i];
            [bubbleData addObject:singleData];
        }
    }
    
    [super reloadData];
}

#pragma mark - UITableViewDataSource implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [bubbleData count];
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCTBubbleData *object = [bubbleData objectAtIndex:indexPath.row];
    UIView *displayed = object.view;
    return MAX(50, displayed.frame.size.height + 20);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCTBubbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_type1"];
    FCTBubbleData *toInject = [bubbleData objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        cell = [[FCTBubbleTableViewCell alloc] initWithData:toInject AvatarEnabled:_avatarEnabled];
    }
        
    return cell;
}

@end
