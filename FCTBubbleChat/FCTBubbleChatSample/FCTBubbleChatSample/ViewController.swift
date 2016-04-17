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
        bubbleTableSample = FCTBubbleChatTableView(frame: self.bounds)
        bubbleTableSample.bubbleDatasource = self
        
        bubbleTableSample.displayShadow = true
        bubbleTableSample.avatarMode = true
        
        self.view.addSubview(bubbleTableSample)
    }
    
    override func viewDidAppear(animated: Bool) {
        bubbleTableSample.reloadData()
        bubbleTableSample.scrollToBottom(true)
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
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date1 = dateFormatter.dateFromString("2016-04-18")
        let data1 = FCTBubbleData(userName: "Sebfct", userPic: UIImage(named:"sebfct_avatar.jpg"), date: date1!, stringContent: "Hi there, is this the new FCTBubbleChat?", type: .Mine)
        
        let date2 = dateFormatter.dateFromString("2016-04-19")
        let data2 = FCTBubbleData(userName: "FCTChat Bot", userPic: UIImage(named:"FCTBot"), date: date2!, stringContent: "Yep, welcome to the underground fellow", type: .Other)
        
        let date3 = dateFormatter.dateFromString("2016-04-20")
        let data3 = FCTBubbleData(userName: "Sebfct", userPic: UIImage(named:"sebfct_avatar.jpg"), date: date3!, stringContent: "Sounds great! Tell me more about its features", type: .Mine)
        
        let date4 = dateFormatter.dateFromString("2016-04-21")
        let data4 = FCTBubbleData(userName: "FCTChat Bot", userPic: UIImage(named:"FCTBot"), date: date4!, stringContent: "I. Bubble frame flexible: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", type: .Other)
        
        dataArray.append(data3)
        dataArray.append(data4)
        dataArray.append(data1)
        dataArray.append(data2)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

