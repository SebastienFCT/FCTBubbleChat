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
    FCTBubbleTableView *bubbleTableView = [[FCTBubbleTableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    [self.view addSubview:bubbleTableView];
    
    /* Init some garbage data */
    FCTBubbleData *data1 = [[FCTBubbleData alloc] initWithMessage:@"Hello world!" AndType:BubbleFromMe];
    FCTBubbleData *data2 = [[FCTBubbleData alloc] initWithMessage:@"Hello you!" AndType:BubbleFromSomeone];
    FCTBubbleData *data3 = [[FCTBubbleData alloc] initWithMessage:@"Hey here, is there any way to display long text?" AndType:BubbleFromMe];
    FCTBubbleData *data4 = [[FCTBubbleData alloc] initWithMessage:@"Yeah, for example: \"What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\"" AndType:BubbleFromSomeone];
    FCTBubbleData *data5 = [[FCTBubbleData alloc] initWithMessage:@"Oh I see, but how your cell will react, especially dealing with the reusability?" AndType:BubbleFromMe];
    FCTBubbleData *data6 = [[FCTBubbleData alloc] initWithMessage:@"We should have a try by posting many message here" AndType:BubbleFromSomeone];
    FCTBubbleData *data7 = [[FCTBubbleData alloc] initWithMessage:@"Ok, we can try this, have a look to these messages:" AndType:BubbleFromMe];
    FCTBubbleData *data8 = [[FCTBubbleData alloc] initWithMessage:@"I'd like to know if someone knows how to reproduce the animation when users open an app folder on iPhone home screen. It looks like you \"dive\" in the folder. I'm adding a files explorer to my app to browse dropbox users photos, I'm using a UICollectionViewController to do it and I would like to reproduce the animation when the user open a folder." AndType:BubbleFromSomeone];
    FCTBubbleData *data9 = [[FCTBubbleData alloc] initWithMessage:@"2014-07-07 16:39:49.677 FCTBubbleChat[5166:60b] Cannot find executable for CFBundle 0x8f95430 </Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/CertUIFramework.axbundle> (not loaded)" AndType:BubbleFromMe];
    FCTBubbleData *data10 = [[FCTBubbleData alloc] initWithMessage:@"原先大家以为这段拉丁文只是没有意义的组合，[1] 目的是让阅读者不要被文章内容所影响，而只专注于观察字型或版型，并借此填满空间。但根据美国拉丁学者Richard McClintock的研究，Lorem ipsum原来起源于西赛罗的《善恶之尽》（De finibus bonorum et malorum）：" AndType:BubbleFromSomeone];
    FCTBubbleData *data11 = [[FCTBubbleData alloc] initWithMessage:@"账户是根据会计科目设置的，具有一定格式和结构，用于反映会计要素的增减变动情况及其结果的载体。每一个账户都有一个名称，用以说明该账户核算的经济内容。账户是根据会计科目设置的，因此账户的名称必须与会计科目一致。" AndType:BubbleFromMe];
    
    [data addObject:data1];
    [data addObject:data2];
    [data addObject:data3];
    [data addObject:data4];
    [data addObject:data5];
    [data addObject:data6];
    [data addObject:data7];
    [data addObject:data8];
    [data addObject:data9];
    [data addObject:data10];
    [data addObject:data11];
    
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
