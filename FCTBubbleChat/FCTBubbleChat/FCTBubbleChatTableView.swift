//
//  FCTBubbleChatTableView.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-08.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit

public protocol FCTBubbleChatTableViewDataSource: NSObjectProtocol {
    func numberOfBubbleForBubbleTable(bubbleTable: FCTBubbleChatTableView) -> Int
    func bubbleTableView(bubbleTableView: FCTBubbleChatTableView, bubbleForRowAtIndex index: Int) -> FCTBubbleData
}

public class FCTBubbleChatTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    //MARK: - Custom Variables
    
    /// The font of your bubble text content
    public var bubbleFont: UIFont = UIFont(name: "HiraKakuProN-W3", size: 20.0)!
    /// The color of the bubble text content
    public var bubbleFontColor: UIColor = UIColor.whiteColor()
    /// The font of the avatar name label
    public var avatarNameFont: UIFont = UIFont(name: "HiraKakuProN-W3", size: 15.0)!
    /// The color of the avatar name label
    public var avatarNameFontColor: UIColor = UIColor.whiteColor()
    /// Display the avatar mode (default: false)
    public var avatarMode: Bool = false
    /// The color for the bubble of type .Mine
    public var bubbleMineColor: UIColor = UIColor(red: 0/255.0, green: 166/255.0, blue: 186/255.0, alpha: 1.0)
    /// The color for the bubble of type .Other
    public var bubbleOtherColor: UIColor = UIColor(red: 244/255.0, green: 198/255.0, blue: 211/255.0, alpha: 1.0)
    /// Display shadow (default: false)
    public var displayShadow: Bool = false
    
    public var bubbleDatasource: FCTBubbleChatTableViewDataSource?
    private var bubbleDataList: Array<FCTBubbleData?> = Array()
    private let reusableCellID: String = "fctBubbleCell"
    
    //MARK: - Init
    
    init() {
        super.init(frame: CGRectZero, style: .Plain)
        initValue()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        initValue()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
    
    func initValue() {
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .None
        self.backgroundColor = UIColor.clearColor()
        
        self.registerNib(UINib(nibName: "FCTBubbleTableViewCell", bundle: NSBundle.init(identifier: "sfct.FCTBubbleChat")), forCellReuseIdentifier: reusableCellID)
    }
    
    //MARK: - FCTBubbleTable Mangement
    
    override public func reloadData() {
        guard let datasource = self.bubbleDatasource, let numberOfRow = self.bubbleDatasource?.numberOfBubbleForBubbleTable(self) else {
            return
        }
        
        if numberOfRow > 0 {
            for i in 0..<numberOfRow {
                bubbleDataList.append(datasource.bubbleTableView(self, bubbleForRowAtIndex: i))
            }
        }
        
        super.reloadData()
    }
    
    //MARK: - TableView Datasource
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bubbleDataList.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reusableCellID) as! FCTBubbleTableViewCell?
        
        if (cell == nil) {
            tableView.registerNib(UINib(nibName: "FCTBubbleTableViewCell", bundle: NSBundle.init(identifier: "sfct.FCTBubbleChat")), forCellReuseIdentifier: reusableCellID)
            let cell = FCTBubbleTableViewCell()
        }
        
        guard let data = bubbleDataList[indexPath.row] else {
            cell?.bubbleFrame.text = "Hello Swift Developer, your data has no stringContent here..."
            return cell!
        }
        
        cell?.backgroundColor = UIColor.clearColor()
        cell?.bubbleFrame.textFont = self.bubbleFont
        cell?.bubbleFrame.textColor = self.bubbleFontColor
        cell?.bubbleFrame.avatarFont = self.avatarNameFont
        cell?.bubbleFrame.avatarColor = self.avatarNameFontColor
        cell?.bubbleFrame.bubbleMineColor = self.bubbleMineColor
        cell?.bubbleFrame.bubbleOtherColor = self.bubbleOtherColor
        cell?.bubbleFrame.displayShadow = self.displayShadow
        
        cell?.bubbleFrame.bubbleType = data.type
        
        cell?.bubbleFrame.text = data.stringContent != nil ? data.stringContent! : ""
        cell?.bubbleFrame.username = data.userName != nil ? data.userName! : ""
        
        if avatarMode {
            cell?.bubbleFrame.picMode = avatarMode
            cell?.bubbleFrame.avatarPic = data.userPic != nil ? data.userPic! : nil
        }

        return cell!
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        guard let data = bubbleDataList[indexPath.row] else {
            return 20.0
        }
    
        if avatarMode {
            return 80 + data.stringContent!.heightWithConstrainedWidth(self.frame.width - 135, font: bubbleFont)
        } else {
            return 80 + data.stringContent!.heightWithConstrainedWidth(self.frame.width - 105, font: bubbleFont)
        }
    }
    
    //MARK: - Public methods
    
    public func scrollToBottom(animated: Bool) {
        let contentHeight = self.contentSize.height
        
        if contentHeight > self.bounds.size.height {
            self.setContentOffset(CGPointMake(0, contentHeight - self.bounds.size.height), animated: animated)
        }
    }

}
