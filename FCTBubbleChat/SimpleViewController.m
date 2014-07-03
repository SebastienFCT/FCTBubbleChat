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
    /** Some useless data to inject in our FCTTableView **/
    FCTBubbleData *data1 = [[FCTBubbleData alloc] initWithMessage:@"Hello World"];
    FCTBubbleData *data2 = [[FCTBubbleData alloc] initWithMessage:@"I am a custom Table View, I hold small text, middle or long..."];
    FCTBubbleData *data3 = [[FCTBubbleData alloc] initWithMessage:@"See by yourself: The UITableViewCell class defines the attributes and behavior of the cells that appear in UITableView objects. This class includes properties and methods for setting and managing cell content and background (including text, images, and custom views), managing the cell selection and highlight state, managing accessory views, and initiating the editing of the cell contents. \r \r When creating cells, you can customize them yourself or use one of several predefined styles. The predefined cell styles are the simplest option. With the predefined styles, the cell provides label and image subviews whose positions and styling are fixed. All you have to do is provide the text and image content to go into those fixed views. To use a cell with a predefined style, initialize it using the initWithStyle:reuseIdentifier: method or configure the cell with that style in Xcode. To set the text and images of the cell, use the textLabel, detailTextLabel, and imageView properties. \r \r If you want to go beyond the predefined styles, you can add subviews to the contentView property of the cell. When adding subviews, you are responsible for positioning those views and setting their content yourself. \r \r Whether you use a predefined or custom cell, you can change the cell’s background using the backgroundView property or by changing the inherited backgroundColor property. In iOS 7, cells have a white background by default; in earlier versions of iOS, cells inherit the background color of the enclosing table view. If you want to change the background color of a cell, do so in the tableView:willDisplayCell:forRowAtIndexPath: method of your table view delegate. \r \r For more information about creating cells, see “A Closer Look at Table View Cells” in Table View Programming Guide for iOS."];
    
    data = [[NSMutableArray alloc] initWithObjects:data1, data2, data3, nil];
    
    [super viewDidLoad];
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
    
    FCTBubbleTableView *bubbleTableView = [[FCTBubbleTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:bubbleTableView];
}

@end
