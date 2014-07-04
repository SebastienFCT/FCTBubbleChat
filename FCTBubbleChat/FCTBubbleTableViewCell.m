//
//  FCTBubbleTableViewCell.m
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/1/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import "FCTBubbleTableViewCell.h"

@interface FCTBubbleTableViewCell ()

@property (retain) UIView *customView;

- (void)makeTheCell;

@end

@implementation FCTBubbleTableViewCell

@synthesize data = _data;

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
	[self makeTheCell];
}

- (void)makeTheCell
{
    [self.customView removeFromSuperview];
    
    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 100, 50)];
    test.text = @"See by yourself: The UITableViewCell class defines the attributes and behavior of the cells that appear in UITableView objects. This class includes properties and methods for setting and managing cell content and background (including text, images, and custom views), managing the cell selection and highlight state, managing accessory views, and initiating the editing of the cell contents. \r \r When creating cells, you can customize them yourself or use one of several predefined styles. The predefined cell styles are the simplest option. With the predefined styles, the cell provides label and image subviews whose positions and styling are fixed. All you have to do is provide the text and image content to go into those fixed views. To use a cell with a predefined style, initialize it using the initWithStyle:reuseIdentifier: method or configure the cell with that style in Xcode. To set the text and images of the cell, use the textLabel, detailTextLabel, and imageView properties. \r \r If you want to go beyond the predefined styles, you can add subviews to the contentView property of the cell. When adding subviews, you are responsible for positioning those views and setting their content yourself. \r \r Whether you use a predefined or custom cell, you can change the cell’s background using the backgroundView property or by changing the inherited backgroundColor property. In iOS 7, cells have a white background by default; in earlier versions of iOS, cells inherit the background color of the enclosing table view. If you want to change the background color of a cell, do so in the tableView:willDisplayCell:forRowAtIndexPath: method of your table view delegate. \r \r For more information about creating cells, see “A Closer Look at Table View Cells” in Table View Programming Guide for iOS.";
    
    UIFont *font = [UIFont fontWithName:@"Arial" size:16];
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:(test.text ? test.text : @"") attributes:@{NSFontAttributeName: font}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){220, 10000} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize size = rect.size;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = (test.text ? test.text : @"");
    label.font = font;
    label.backgroundColor = [UIColor clearColor];
    [label.layer setCornerRadius:8.0f];
    [label.layer setBorderWidth:1.0];
    [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];

    self.customView = label;
    
    [self.contentView addSubview:self.customView];
}

@end
