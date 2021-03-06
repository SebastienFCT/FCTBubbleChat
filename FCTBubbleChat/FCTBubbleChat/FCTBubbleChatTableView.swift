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
    private var bubbleMatrix: Array<Array<FCTBubbleData?>> = []
    private let reusableCellID: String = "fctBubbleCell"
    private let reusableHeaderID: String = "fctBubbleHeader"
    
    //MARK: - Init
    
    init() {
        super.init(frame: CGRectZero, style: .Plain)
        initValue()
    }
    
    public override init(frame: CGRect, style: UITableViewStyle) {
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
        self.showsVerticalScrollIndicator = false
        
        self.registerNib(UINib(nibName: "FCTBubbleTableViewCell", bundle: NSBundle.init(identifier: "sfct.FCTBubbleChat")), forCellReuseIdentifier: reusableCellID)
    }
    
    //MARK: - FCTBubbleTable Mangement
    
    override public func reloadData() {
        guard let datasource = self.bubbleDatasource, let numberOfRow = self.bubbleDatasource?.numberOfBubbleForBubbleTable(self) else {
            return
        }
        
        var bubbleDataList: Array = Array<FCTBubbleData>()
        bubbleMatrix = Array()
        
        if numberOfRow > 0 {
            for i in 0..<numberOfRow {
                bubbleDataList.append(datasource.bubbleTableView(self, bubbleForRowAtIndex: i))
            }
        }
        
        bubbleDataList.sortInPlace({ $0.date.compare($1.date) == NSComparisonResult.OrderedAscending })
        
        var bubbleMatrixRow: Array = Array<FCTBubbleData?>()
        
        bubbleMatrixRow.append(bubbleDataList[0])
        
        if bubbleDataList.count > 1 {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            var currentDate = bubbleDataList[0].date
            
            for i in 1..<numberOfRow {
                let newDate = bubbleDataList[i].date
                if dateFormatter.stringFromDate(currentDate) == dateFormatter.stringFromDate(newDate) {
                    bubbleMatrixRow.append(bubbleDataList[i])
                } else {
                    bubbleMatrix.append(bubbleMatrixRow)
                    bubbleMatrixRow = Array<FCTBubbleData?>()
                    bubbleMatrixRow.append(bubbleDataList[i])
                    currentDate = bubbleDataList[i].date
                }
                
                if i == numberOfRow - 1 {
                    bubbleMatrix.append(bubbleMatrixRow)
                }
            }
        }
        
        super.reloadData()
    }
    
    //MARK: - TableView Datasource
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return bubbleMatrix.count
    }
    
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionData = bubbleMatrix[section]
        
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(reusableHeaderID)
        
        if header == nil {
            let header = UITableViewHeaderFooterView()
        }
        
        guard let title = bubbleMatrix[section][0] else {
            return nil
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let currentDate = title.date
        
        let content = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 50))
        
        let sectionHeader = UILabel(frame: CGRect(x: 0, y: 10, width: bounds.width, height: 30))
        sectionHeader.backgroundColor = UIColor.clearColor()
        sectionHeader.text = "--- \(dateFormatter.stringFromDate(currentDate)) ---"
        sectionHeader.textColor = UIColor.darkGrayColor()
        sectionHeader.textAlignment = .Center
        sectionHeader.font = UIFont(name: "HiraKakuProN-W3", size: 20.0)!
        
        content.addSubview(sectionHeader)
        
        return content
    }
    
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = bubbleMatrix[section]
        return section.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let section = bubbleMatrix[indexPath.section]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reusableCellID, forIndexPath: indexPath) as! FCTBubbleTableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .None
        
        cell.bubbleFrame.textFont = self.bubbleFont
        cell.bubbleFrame.textColor = self.bubbleFontColor
        cell.bubbleFrame.avatarFont = self.avatarNameFont
        cell.bubbleFrame.avatarColor = self.avatarNameFontColor
        cell.bubbleFrame.bubbleMineColor = self.bubbleMineColor
        cell.bubbleFrame.bubbleOtherColor = self.bubbleOtherColor
        cell.bubbleFrame.displayShadow = self.displayShadow
        
        guard let data = section[indexPath.row] else {
            cell.bubbleFrame.text = "Hello Swift Developer, possible error with bubbleDAtaList[indexPath.row]"
            return cell
        }
        
        cell.bubbleFrame.bubbleType = data.type
        cell.bubbleFrame.contentType = data.contentType
        
        cell.bubbleFrame.username = data.userName != nil ? data.userName! : ""
        
        switch data.contentType {
        case .Text:
            cell.bubbleFrame.imageContent = nil
            cell.bubbleFrame.text = data.stringContent != nil ? data.stringContent! : ""
        case .Image:
            cell.bubbleFrame.text = nil
            cell.bubbleFrame.imageContent = data.imageContent != nil ? data.imageContent! : UIImage()
        }
        
        if avatarMode {
            cell.bubbleFrame.picMode = avatarMode
            cell.bubbleFrame.avatarPic = data.userPic != nil ? data.userPic! : nil
        }
        
        cell.bubbleFrame.setNeedsLayout()
        
        return cell
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let section = bubbleMatrix[indexPath.section]
        
        guard let data = section[indexPath.row] else {
            return 20.0
        }
        
        switch data.contentType {
        case .Text:
            if avatarMode {
                return 80 + data.stringContent!.heightWithConstrainedWidth(self.frame.width - 135, font: bubbleFont)
            } else {
                return 80 + data.stringContent!.heightWithConstrainedWidth(self.frame.width - 105, font: bubbleFont)
            }
        case .Image:
            let newHeight = (data.imageContent?.size.height)! / (data.imageContent?.size.width)! * (self.bounds.width - 135)
            return newHeight + 80
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
