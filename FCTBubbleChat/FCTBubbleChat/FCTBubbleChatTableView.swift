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

    public var bubbleDatasource: FCTBubbleChatTableViewDataSource?
    var bubbleDataList: Array<FCTBubbleData?> = Array()
    let reusableCellID: String = "fctBubbleCell"
    
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
        
        self.registerNib(UINib(nibName: "FCTBubbleTableViewCell", bundle: NSBundle.init(identifier: "sfct.FCTBubbleChat")), forCellReuseIdentifier: reusableCellID)
    }
    
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
        
        cell?.bubbleFrame.text = data.stringContent!

        return cell!
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var text = ""
        
        guard let data = bubbleDataList[indexPath.row] else {
            text = "Hello Swift Developer, your data has no stringContent here..."
            return 20.0
        }
        
        text = data.stringContent!
    
        return 80 + text.heightWithConstrainedWidth(self.frame.width - 60, font: UIFont(name: "HiraKakuProN-W3", size: 20.0)!)
    }

}
