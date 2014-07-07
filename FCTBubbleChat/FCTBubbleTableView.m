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
    NSMutableArray *bubbleStack;
}

#pragma mark - init

// Init with garbage data in order to test
- (void)basicInit
{
    self.dataSource = self;
    self.delegate = self;
    
    NSString *data1 = @"Hello World";
    NSString *data2 = @"Hello you, this message should be enough longer to be displayed in two row.... we all hop so!";
    [bubbleStack addObject:data1];
    [bubbleStack addObject:data2];
}

- (id)initForTest
{
    if (self = [super init]) {
        [self basicInit];
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
