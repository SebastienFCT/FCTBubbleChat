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

@optional

@required

- (NSInteger)numberOfRowForTableView:(FCTBubbleTableView)tableView;
- (FCTBubbleData *)tableView:(FCTBubbleTableView *) dataForRow:(NSInteger)row;

@end
