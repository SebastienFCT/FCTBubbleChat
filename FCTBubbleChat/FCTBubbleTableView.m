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
    
    /** Some useless data to inject in our FCTTableView **/
    FCTBubbleData *data1 = [[FCTBubbleData alloc] initWithMessage:@"Hello World"];
    FCTBubbleData *data2 = [[FCTBubbleData alloc] initWithMessage:@"I am a custom Table View, I hold small text, middle or long..."];
    FCTBubbleData *data3 = [[FCTBubbleData alloc] initWithMessage:@"See by yourself: The UITableViewCell class defines the attributes and behavior of the cells that appear in UITableView objects. This class includes properties and methods for setting and managing cell content and background (including text, images, and custom views), managing the cell selection and highlight state, managing accessory views, and initiating the editing of the cell contents. \r \r When creating cells, you can customize them yourself or use one of several predefined styles. The predefined cell styles are the simplest option. With the predefined styles, the cell provides label and image subviews whose positions and styling are fixed. All you have to do is provide the text and image content to go into those fixed views. To use a cell with a predefined style, initialize it using the initWithStyle:reuseIdentifier: method or configure the cell with that style in Xcode. To set the text and images of the cell, use the textLabel, detailTextLabel, and imageView properties. \r \r If you want to go beyond the predefined styles, you can add subviews to the contentView property of the cell. When adding subviews, you are responsible for positioning those views and setting their content yourself. \r \r Whether you use a predefined or custom cell, you can change the cell’s background using the backgroundView property or by changing the inherited backgroundColor property. In iOS 7, cells have a white background by default; in earlier versions of iOS, cells inherit the background color of the enclosing table view. If you want to change the background color of a cell, do so in the tableView:willDisplayCell:forRowAtIndexPath: method of your table view delegate. \r \r For more information about creating cells, see “A Closer Look at Table View Cells” in Table View Programming Guide for iOS."];
    
    data = [[NSMutableArray alloc] initWithObjects:data1, data2, data3, nil];
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
