//
//  FCTBubbleTableViewDatasource.h
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/2/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FCTBubbleData;
@class FCTBubbleTableView;
@protocol FCTBubbleTableViewDatasource <NSObject>

@optional

@required

- (NSInteger)rowsForBubbleTable:(FCTBubbleTableView *)tableView;
- (FCTBubbleData *)bubbleTableView:(FCTBubbleTableView *)tableView dataForRow:(NSInteger)row;

@end
