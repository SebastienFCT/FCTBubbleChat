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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        
        bubbleTableSample = FCTBubbleChatTableView(frame: CGRect(x: 0, y: 40, width: bounds.width, height: UIScreen.mainScreen().bounds.size.height))
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
        let data = FCTBubbleData(userName: "sebfct", userPic: nil, stringContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        
        return data
    }

}

