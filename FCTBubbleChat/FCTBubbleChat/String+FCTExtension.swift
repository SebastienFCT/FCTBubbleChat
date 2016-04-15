//
//  String+FCTExtension.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-14.
//  Copyright © 2016 sebfct. All rights reserved.
//

import Foundation

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}