FCTBubbleChat
=============

This project is purposing a control for displaying Chat conversation in your ios application.

In building...

Installation
=============
* Download the current project
* Copy the `src` folder within your own project.

Using FCTBubbleChat
=============
Your controller must implement the protocol for the datasources:

> @interface SimpleViewController : UIViewController\<FCTBubbleTableViewDatasource>

In your controller implementation, you must implement the datasource method for your custom `FCTTableView`:

```objective-c
@required

//  These method are similar to UITableView
//  Basically your will provide the required data dealing with:
//  ---
//  1. The number of cell in your FCTBubbleTableView
//  2. The FCTBubbleData linked to each cell

- (NSInteger)numberOfRowForTableView:(FCTBubbleTableView *)tableView;
- (FCTBubbleData *)tableView:(FCTBubbleTableView *)tableView dataForRow:(NSInteger)row;
```
Your cell generation must be done by providing `FCTBubbleData`, for now you can use the following init:
```objective-c
- (id)initWithMessage:(NSString *)message Date:(NSDate *)date AndType:(FCTBubbleType)type;
- (id)initWithPicture:(UIImage *)picture Date:(NSDate *)date AndType:(FCTBubbleType)type;
- (id)initWithSound:(NSURL *)soundPath Date:(NSDate *)date Type:(FCTBubbleType)type;
```
You can also provide avatar in your custom table view by setting its `avatarEnabled` to `YES`, in that case, you should use the following init for your `FCTBubbleData` generation (note that if you do not provide them, the avatar will be set to its default value: nil which is generating the default avatar):
```objective-c
- (id)initWithMessage:(NSString *)message Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;
- (id)initWithPicture:(UIImage *)picture Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;
- (id)initWithSound:(NSURL *)soundPath Date:(NSDate *)date Type:(FCTBubbleType)type AndAvatar:(UIImage *)avatar;
```

Main features
=============
* `avatarEnabled` property allow avatar in the FCTTableView (`BOOL`).
* `avatarStyle` property purpose selecting one of the custom style:
    - `basicAvatar`
    - `squarreAvatar`
    - `circleAvatar`
    - `bannerAvatar (in building)`
* `typeDate` property purpose selecting on of the custom style for the timestamp:
    - `bubbleBasicDate`
    - `bubbleCustomDate1`

Known issue:
=============
- This project is not available for non-ARC project.

Licence
=============

FCTBubbleChat is available under MIT license, please see the `LICENSE.md` file for more information.
