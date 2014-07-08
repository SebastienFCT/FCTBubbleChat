//
//  FCTBubbleTableViewDatasource.h
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/7/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FCTBubbleTableView;
@class FCTBubbleData;
@protocol FCTBubbleTableViewDatasource <NSObject>

@required

//  These method are similar to UITableView
//  Basically your will provide the required data dealing with:
//
//  1) The number of cell in your FCTBubbleTableView
//  2) The FCTBubbleData linked to each cell

- (NSInteger)numberOfRowForTableView:(FCTBubbleTableView *)tableView;
- (FCTBubbleData *)tableView:(FCTBubbleTableView *)tableView dataForRow:(NSInteger)row;

@optional

@end
