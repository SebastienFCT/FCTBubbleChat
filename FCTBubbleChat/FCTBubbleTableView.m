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

@implementation FCTBubbleTableView {
    NSMutableArray *data;
}

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCTBubbleData *object = [data objectAtIndex:indexPath.row];
    UILabel *bubble = object.bubble;
    CGFloat height = bubble.frame.size.height;
    
    return height;
    NSLog(@"%f", height);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCTBubbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCTBubbleCell"];

    if (cell == nil) {
        
        FCTBubbleData *object = [data objectAtIndex:indexPath.row];
        UILabel *bubble = object.bubble;
        
        cell = [[FCTBubbleTableViewCell alloc] initWithCustomView:bubble];
    }
        
    return cell;
}

@end
