//
//  SimpleViewController.h
//  FCTBubbleChat
//
//  Created by Sebastien FCT on 7/2/14.
//  Copyright (c) 2014 Sebastien FCT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FCTBubbleTableViewDatasource.h"

@interface SimpleViewController : UIViewController<FCTBubbleTableViewDatasource, UITextFieldDelegate>

@end
