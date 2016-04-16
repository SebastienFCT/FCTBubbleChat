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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.generateData()
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        
        bubbleTableSample = FCTBubbleChatTableView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: UIScreen.mainScreen().bounds.size.height))
        bubbleTableSample.avatarMode = true
        bubbleTableSample.bubbleDatasource = self
        
        self.view.addSubview(bubbleTableSample)
        bubbleTableSample.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: FCTBubbleChat
    
    func numberOfBubbleForBubbleTable(bubbleTable: FCTBubbleChatTableView) -> Int {
        return 3
    }
    
    func bubbleTableView(bubbleTableView: FCTBubbleChatTableView, bubbleForRowAtIndex index: Int) -> FCTBubbleData {
        let data = dataArray[index]
        
        return data
    }
    
    //MARK: Helpers
    
    func generateData() {
        let data1 = FCTBubbleData(userName: "Sebfct", userPic: UIImage(named:"sebfct_avatar.jpg"), stringContent: "Hi there, is this the new FCTBubbleChat?", type: .Mine)
        dataArray.append(data1)
        let data2 = FCTBubbleData(userName: "FCTChat Bot", userPic: UIImage(named:"FCTBot"), stringContent: "Yep, welcome to the underground fellow", type: .Other)
        dataArray.append(data2)
        let data3 = FCTBubbleData(userName: "Sebfct", userPic: UIImage(named:"sebfct_avatar.jpg"), stringContent: "Sounds great! Tell me more about its features", type: .Mine)
        dataArray.append(data3)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

