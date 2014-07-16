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
    NSMutableArray *allSection;
}

@synthesize bubbleDataSource = _bubbleDataSource;
@synthesize avatarEnabled = _avatarEnabled;
@synthesize avatarStyle = _avatarStyle;
@synthesize sound = _sound;
@synthesize typeDate = _typeDate;

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
    _typeDate = bubbleBasicDate;
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
    allSection = [[NSMutableArray alloc] init];
    NSDate *dateReference = [NSDate dateWithTimeIntervalSince1970:0];
    NSMutableArray *newSection;
    
    if (self.bubbleDataSource && [self.bubbleDataSource numberOfRowForTableView:self] > 0) {
        for (int i = 0; i < [self.bubbleDataSource numberOfRowForTableView:self]; i++) {
            FCTBubbleData *singleData = [self.bubbleDataSource tableView:self dataForRow:i];
            [bubbleData addObject:singleData];
        }
        for (int i = 0; i < [bubbleData count]; i++) {
            FCTBubbleData *data = [bubbleData objectAtIndex:i];
            if ([data.date timeIntervalSinceDate:dateReference] > 1800) {
                newSection = [[NSMutableArray alloc] init];
                [newSection addObject:data.date];
                [allSection addObject:newSection];
                dateReference = data.date;
            }
            [newSection addObject:data];
        }
    }
    
    [super reloadData];
}

#pragma mark - UITableViewDataSource implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [allSection count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [allSection objectAtIndex:section];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCTBubbleTableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell_type0"];
        NSArray *array = [allSection objectAtIndex:indexPath.section];
        NSDate *date = [array objectAtIndex:indexPath.row];
        
        if (cell == nil) {
            cell = [[FCTBubbleTableViewCell alloc] init];
        }
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"DST"]]; // 974 on est toujours là
        NSString *stringFromDate = [formatter stringFromDate:date];
        if (_typeDate == bubbleBasicDate) {
            UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width, 20)];
            dateLabel.text = stringFromDate;
            dateLabel.textAlignment = NSTextAlignmentCenter;
            dateLabel.font = [UIFont fontWithName:@"Arial" size:12];
            
            [cell addSubview:dateLabel];
        } else {
            UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 80, 10, 160, 20)];
            dateLabel.text = stringFromDate;
            dateLabel.textAlignment = NSTextAlignmentCenter;
            dateLabel.font = [UIFont fontWithName:@"Arial" size:12];
            [dateLabel.layer setCornerRadius:8.0];
            [dateLabel.layer setBorderWidth:1.0];
            [dateLabel.layer setBorderColor:[UIColor colorWithRed:231/255.0f green:231/255.0f blue:231/255.0f alpha:1.0].CGColor];
            dateLabel.backgroundColor = [UIColor colorWithRed:231/255.0f green:231/255.0f blue:231/255.0f alpha:1.0];
            dateLabel.layer.masksToBounds = YES;
            
            [cell addSubview:dateLabel];
        }
        
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell_type1"];
        NSArray *array = [allSection objectAtIndex:indexPath.section];
        FCTBubbleData *toInject = [array objectAtIndex:indexPath.row];
        
        if (cell == nil) {
            cell = [[FCTBubbleTableViewCell alloc] initWithData:toInject AvatarEnabled:_avatarEnabled WithStyle:_avatarStyle];
        }
    }
        
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    } else {
        NSArray *array = [allSection objectAtIndex:indexPath.section];
        FCTBubbleData *object = [array objectAtIndex:indexPath.row];
        UIView *displayed = object.view;
        return MAX(50, displayed.frame.size.height + 20);
    }
}

@end
