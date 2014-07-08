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

#pragma mark - Init

- (id)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.delegate = self;
    self.dataSource = self;
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
    UILabel *displayed = object.label;
    return displayed.frame.size.height + 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCTBubbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_type1"];
    
    FCTBubbleData *toInject = [bubbleData objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        cell = [[FCTBubbleTableViewCell alloc] initWithData:toInject];
    }
        
    return cell;
}

@end
