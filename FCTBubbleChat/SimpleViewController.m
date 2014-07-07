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
    self.view.backgroundColor = [UIColor orangeColor];
    
    /* Init the custom tableView */
    FCTBubbleTableView *bubbleTableView = [[FCTBubbleTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:bubbleTableView];
    
    /* Init some garbage data */
    FCTBubbleData *data1 = [[FCTBubbleData alloc] initWithMessage:@"Hello world!"];
    FCTBubbleData *data2 = [[FCTBubbleData alloc] initWithMessage:@"Hello you!"];
    FCTBubbleData *data3 = [[FCTBubbleData alloc] initWithMessage:@"Hey here, is there any way to display long text?"];
    
    [data addObject:data1];
    [data addObject:data2];
    [data addObject:data3];
    
    bubbleTableView.bubbleDataSource = self;
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
