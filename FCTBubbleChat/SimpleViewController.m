//
//  SimpleViewController.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/2/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "SimpleViewController.h"

#import "FCTBubbleTableView.h"
#import "FCTBubbleData.h"

@interface SimpleViewController ()

@end

@implementation SimpleViewController {
    NSMutableArray *data;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    /* Init objects */
    data = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
    
    [self makeTheView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeTheView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    /* Init the custom tableView */
    FCTBubbleTableView *bubbleTableView = [[FCTBubbleTableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    [self.view addSubview:bubbleTableView];
    
    /* Init some garbage data */
    NSString *dateString = @"2011-08-12T12:20:00Z";
    NSDateFormatter *fmt = [NSDateFormatter new];
    [fmt setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate* date = [fmt dateFromString:dateString];
    
    FCTBubbleData *data1 = [[FCTBubbleData alloc] initWithMessage:@"Hello world!" Date:date Type:BubbleFromMe AndAvatar:[UIImage imageNamed:@"fctbc_ic_custom_avatar.png"]];
    FCTBubbleData *data2 = [[FCTBubbleData alloc] initWithMessage:@"Hello you!" Date:date AndType:BubbleFromSomeone];
    FCTBubbleData *data3 = [[FCTBubbleData alloc] initWithMessage:@"Long time no see! 我现在吃西瓜。" Date:[NSDate date] Type:BubbleFromMe AndAvatar:[UIImage imageNamed:@"fctbc_ic_custom_avatar.png"]];
    FCTBubbleData *data4 = [[FCTBubbleData alloc] initWithMessage:@"给我看！" Date:[NSDate date] AndType:BubbleFromSomeone];
    FCTBubbleData *data5 = [[FCTBubbleData alloc] initWithPicture:[UIImage imageNamed:@"image.jpg"] Date:[NSDate date] Type:BubbleFromMe AndAvatar:[UIImage imageNamed:@"fctbc_ic_custom_avatar.png"]];
    
    [data addObject:data1];
    [data addObject:data2];
    [data addObject:data3];
    [data addObject:data4];
    [data addObject:data5];
    
    bubbleTableView.bubbleDataSource = self;
    
    // Custom configuration
    bubbleTableView.avatarEnabled = YES;
    //bubbleTableView.avatarStyle = circleAvatar;
    
    [bubbleTableView reloadData];
}

#pragma mark - FCTTableView datasource

- (NSInteger)numberOfRowForTableView:(FCTBubbleTableView *)tableView
{
    return [data count];
}

- (FCTBubbleData *)tableView:(FCTBubbleTableView *)tableView dataForRow:(NSInteger)row
{
    FCTBubbleData *toPresent = [data objectAtIndex:row];
    return toPresent;
}

@end
