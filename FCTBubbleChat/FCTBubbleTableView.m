//
//  FCTBubbleTableView.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/2/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleTableView.h"

@interface FCTBubbleTableView ()

@property (strong) NSMutableArray *nbBubble;

@end

@implementation FCTBubbleTableView

@synthesize nbBubble = _nbBubble;

#pragma mark - init

- (void)initFCTBubbleTableView
{
    self.delegate = self;
    self.dataSource = self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initFCTBubbleTableView];
    }
    return self;
}

#pragma mark - UITableViewDataSource implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCTBubbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCTBubbleCell"];

    if (cell == nil) {
        cell = [[FCTBubbleTableViewCell alloc] init];
    }
        
    return cell;
}

@end
