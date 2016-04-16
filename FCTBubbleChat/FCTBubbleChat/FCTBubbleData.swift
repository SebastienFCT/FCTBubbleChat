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
    var userName: String?
    var userPic: UIImage?
    
    // Bubble content
    var stringContent: String?
    
    public convenience init(userName: String?, userPic: UIImage?, stringContent: String, type: FCTBubbleDataType) {
        self.init()
        
        self.userName = userName
        self.userPic = userPic
        self.type = type
        
        self.stringContent = stringContent
    }
}
