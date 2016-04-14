//
//  FCTBubbleData.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-08.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit

enum FCTBubbleDataType: Int {
    case Mine
    case Other
}

public class FCTBubbleData: NSObject {

    let type: FCTBubbleDataType = .Mine
    
    // Bubble infos
    var userName: String?
    var userPic: UIImage?
    
    // Bubble content
    var stringContent: String?
    
    public convenience init(userName: String?, userPic: UIImage?, stringContent: String) {
        self.init()
        
        self.userName = userName
        self.userPic = userPic
        
        self.stringContent = stringContent
    }
}
