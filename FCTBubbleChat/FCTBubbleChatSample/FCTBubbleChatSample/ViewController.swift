//
//  ViewController.swift
//  FCTBubbleChatSample
//
//  Created by sebastien FOCK CHOW THO on 2016-04-14.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit
import FCTBubbleChat

class ViewController: UIViewController, FCTBubbleChatTableViewDataSource {
    
    var bubbleTableSample: FCTBubbleChatTableView!
    var dataArray: Array = [FCTBubbleData]()
    let bounds: CGRect = UIScreen.mainScreen().bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.generateData()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        // FCTBubbleTable Sample
        bubbleTableSample = FCTBubbleChatTableView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: UIScreen.mainScreen().bounds.size.height))
        bubbleTableSample.bubbleDatasource = self
        
        bubbleTableSample.displayShadow = true
        bubbleTableSample.avatarMode = true
        
        self.view.addSubview(bubbleTableSample)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - FCTBubbleChat Management
    
    func numberOfBubbleForBubbleTable(bubbleTable: FCTBubbleChatTableView) -> Int {
        return dataArray.count
    }
    
    func bubbleTableView(bubbleTableView: FCTBubbleChatTableView, bubbleForRowAtIndex index: Int) -> FCTBubbleData {
        let data = dataArray[index]
        
        return data
    }
    
    //MARK: - Helpers
    
    func generateData() {
        let data1 = FCTBubbleData(userName: "Sebfct", userPic: UIImage(named:"sebfct_avatar.jpg"), stringContent: "Hi there, is this the new FCTBubbleChat?", type: .Mine)
        dataArray.append(data1)
        let data2 = FCTBubbleData(userName: "FCTChat Bot", userPic: UIImage(named:"FCTBot"), stringContent: "Yep, welcome to the underground fellow", type: .Other)
        dataArray.append(data2)
        let data3 = FCTBubbleData(userName: "Sebfct", userPic: UIImage(named:"sebfct_avatar.jpg"), stringContent: "Sounds great! Tell me more about its features", type: .Mine)
        dataArray.append(data3)
        let data4 = FCTBubbleData(userName: "FCTChat Bot", userPic: UIImage(named:"FCTBot"), stringContent: "I. Bubble frame flexible: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", type: .Other)
        dataArray.append(data4)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

