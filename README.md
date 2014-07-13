FCTBubbleChat
=============

This project is purposing a control for displaying Chat conversation in your ios application.

In building...

Installation
=============

Using FCTBubbleChat
=============
Your controller must implement the protocol for the datasources:

> @interface SimpleViewController : UIViewController\<FCTBubbleTableViewDatasource>

In your controller implementation, you must implement the datasource method for your custom `FCTTableView`:

    @required

    //  These method are similar to UITableView
    //  Basically your will provide the required data dealing with:
    //  ---
    //  1. The number of cell in your FCTBubbleTableView
    //  2. The FCTBubbleData linked to each cell

    - (NSInteger)numberOfRowForTableView:(FCTBubbleTableView *)tableView;
    - (FCTBubbleData *)tableView:(FCTBubbleTableView *)tableView dataForRow:(NSInteger)row;

Your cell generation must be done by providing `FCTBubbleData`, for now you can use the following init:

    - (id)initWithMessage:(NSString *)message Date:(NSDate *)date AndType:(FCTBubbleType)type;
    - (id)initWithPicture:(UIImage *)picture Date:(NSDate *)date AndType:(FCTBubbleType)type;
    - (id)initWithSound:(NSURL *)soundPath Date:(NSDate *)date Type:(FCTBubbleType)type;

You can also provide avatar in your custom table view by setting its `avatarEnabled` to `YES`, in that case, you should use the following init for your `FCTBubbleData` generation (note that if you do not provide them, the avatar will be set to its default value: nil which is generating the default avatar):


    - (id)initWithMessage:(NSString *)message Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;
    - (id)initWithPicture:(UIImage *)picture Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;
    - (id)initWithSound:(NSURL *)soundPath Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;

Known issue:
=============
- Actually crashing with 64bit processor.

Licence
=============

