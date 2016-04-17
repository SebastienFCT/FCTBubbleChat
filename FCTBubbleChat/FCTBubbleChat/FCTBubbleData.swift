//
//  FCTBubbleData.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-08.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit

public enum FCTBubbleDataType: Int {
    case Mine
    case Other
}

public class FCTBubbleData: NSObject {

    var type: FCTBubbleDataType = .Mine
    
    // Bubble infos
    internal var userName: String?
    internal var userPic: UIImage?
    internal var date: NSDate!
    
    // Bubble content
    internal var stringContent: String?
    
    public convenience init(userName: String?, userPic: UIImage?, date: NSDate, stringContent: String, type: FCTBubbleDataType) {
        self.init()
        
        self.userName = userName
        self.userPic = userPic
        self.type = type
        self.date = date
        
        self.stringContent = stringContent
    }
}
