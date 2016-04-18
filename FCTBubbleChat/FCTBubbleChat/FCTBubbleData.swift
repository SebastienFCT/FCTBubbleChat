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

public enum FCTBubbleContentType: Int {
    case Text
    case Image
}

public class FCTBubbleData: NSObject {

    var type: FCTBubbleDataType = .Mine
    var contentType: FCTBubbleContentType = .Text
    
    // Bubble infos
    internal var userName: String?
    internal var userPic: UIImage?
    internal var date: NSDate!
    
    // Bubble content
    internal var stringContent: String?
    internal var imageContent: UIImage?
    
    public convenience init(userName: String?, userPic: UIImage?, date: NSDate, stringContent: String, type: FCTBubbleDataType, contentType: FCTBubbleContentType) {
        self.init()
        
        self.userName = userName
        self.userPic = userPic
        self.type = type
        self.contentType = contentType
        self.date = date
        
        self.stringContent = stringContent
    }
    
    public convenience init(userName: String?, userPic: UIImage?, date: NSDate, imageContent: UIImage, type: FCTBubbleDataType, contentType: FCTBubbleContentType) {
        self.init()
        
        self.userName = userName
        self.userPic = userPic
        self.type = type
        self.contentType = contentType
        self.date = date
        
        self.imageContent = imageContent
    }
}
