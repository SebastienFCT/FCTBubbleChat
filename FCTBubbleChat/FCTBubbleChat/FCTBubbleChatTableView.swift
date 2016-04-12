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

    var bubbleDatasource: FCTBubbleChatTableViewDataSource?
    var bubbleDataList: Array<FCTBubbleData> = Array()
    
    init() {
        super.init(frame: CGRectZero, style: .Grouped)
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
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
        // let bubbleData: FCTBubbleData = bubbleDataList[indexPath.row]
        // Draw the cell here
        return UITableViewCell(frame: CGRectZero)
    }

}
