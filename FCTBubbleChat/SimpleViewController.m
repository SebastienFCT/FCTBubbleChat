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
    UITextField *customtextField;
    NSMutableArray *data;
    FCTBubbleTableView *bubbleTableView;
    UIView *chatView;
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
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
    bubbleTableView = [[FCTBubbleTableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 60)];
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
    
    NSString *sound = [[NSBundle mainBundle] pathForResource:@"test3" ofType:@"aiff"];
	NSURL *soundURL = [NSURL fileURLWithPath:sound];
    FCTBubbleData *data6 = [[FCTBubbleData alloc] initWithSound:soundURL Date:[NSDate date] Type:BubbleFromMe AndAvatar:[UIImage imageNamed:@"fctbc_ic_custom_avatar.png"]];
    
    [data addObject:data1];
    [data addObject:data2];
    [data addObject:data3];
    [data addObject:data4];
    [data addObject:data5];
    [data addObject:data6];
    
    bubbleTableView.bubbleDataSource = self;
    
    // Custom configuration
    bubbleTableView.avatarEnabled = YES;
    //bubbleTableView.avatarStyle = circleAvatar;
    
    [bubbleTableView reloadData];
    
    chatView = [[UIView alloc] initWithFrame:CGRectMake(-1, self.view.frame.size.height - 40, self.view.frame.size.width + 2, 140)];
    [chatView.layer setBorderColor:[UIColor colorWithRed:166/255.0f green:166/255.0f blue:166/255.0f alpha:1.0f].CGColor];
    [chatView.layer setBorderWidth:1.0];
    
    customtextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 5, self.view.frame.size.width - 120, 30)];
    customtextField.placeholder = @"Type your message...";
    customtextField.delegate = self;
    [customtextField.layer setCornerRadius:5.0];
    [customtextField.layer setBorderWidth:1.0];
    [customtextField.layer setBorderColor:[UIColor colorWithRed:209/255.0f green:213/255.0f blue:218/255.0f alpha:1.0f].CGColor];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    customtextField.leftView = paddingView;
    customtextField.leftViewMode = UITextFieldViewModeAlways;
    
    [chatView addSubview:customtextField];
    
    UIButton *receive = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 50, 30)];
    [receive setTitle:@"IN" forState:UIControlStateNormal];
    [receive setTitleColor:[UIColor colorWithRed:209/255.0f green:213/255.0f blue:218/255.0f alpha:1.0f] forState:UIControlStateNormal];
    [receive.layer setCornerRadius:4.0];
    [receive.layer setBorderWidth:1.0];
    [receive.layer setBorderColor:[UIColor colorWithRed:209/255.0f green:213/255.0f blue:218/255.0f alpha:1.0f].CGColor];
    [receive addTarget:self action:@selector(receiveMessage:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *send = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 55, 5, 50, 30)];
    [send setTitle:@"OUT" forState:UIControlStateNormal];
    [send setTitleColor:[UIColor colorWithRed:209/255.0f green:213/255.0f blue:218/255.0f alpha:1.0f] forState:UIControlStateNormal];
    [send.layer setCornerRadius:4.0];
    [send.layer setBorderWidth:1.0];
    [send.layer setBorderColor:[UIColor colorWithRed:209/255.0f green:213/255.0f blue:218/255.0f alpha:1.0f].CGColor];
    [send addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:chatView];
    
    [chatView addSubview:send];
    [chatView addSubview:receive];
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

#pragma mark: UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark: Keyboard notification

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect aRect = bubbleTableView.frame;
    aRect.size.height -= kbSize.height;
    bubbleTableView.frame = aRect;
    
    CGRect bRect = chatView.frame;
    bRect.origin.y -= kbSize.height;
    chatView.frame = bRect;
}

- (void)keyboardWillHide:(NSNotification *)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    bubbleTableView.contentInset = contentInsets;
    bubbleTableView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = bubbleTableView.frame;
    aRect.size.height += kbSize.height;
    aRect.origin.y = 20;
    bubbleTableView.frame = aRect;
    
    CGRect bRect = chatView.frame;
    bRect.origin.y += kbSize.height;
    chatView.frame = bRect;
}

#pragma mark: Actions

- (void)sendMessage:(id)sender
{
    if ([customtextField isFirstResponder]) {
        [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *testString = customtextField.text;
        NSString *trimmedString = [testString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if (trimmedString.length > 0)
        {
            FCTBubbleData *toSend = [[FCTBubbleData alloc] initWithMessage:customtextField.text Date:[NSDate date] Type:BubbleFromMe AndAvatar:[UIImage imageNamed:@"fctbc_ic_custom_avatar.png"]];
            [data addObject:toSend];
            customtextField.text = @"";
            [customtextField resignFirstResponder];
            [bubbleTableView reloadData];
        } else {
            [customtextField resignFirstResponder];
        }
    }
}

- (void)receiveMessage:(id)sender
{
    if ([customtextField isFirstResponder]) {
        [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *testString = customtextField.text;
        NSString *trimmedString = [testString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if (trimmedString.length > 0)
        {
            FCTBubbleData *toSend = [[FCTBubbleData alloc] initWithMessage:customtextField.text Date:[NSDate date] AndType:BubbleFromSomeone];;
            [data addObject:toSend];
            customtextField.text = @"";
            [customtextField resignFirstResponder];
            [bubbleTableView reloadData];
        } else {
            [customtextField resignFirstResponder];
        }
    }
}

@end
