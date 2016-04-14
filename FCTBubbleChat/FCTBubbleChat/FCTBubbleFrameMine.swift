//
//  FCTBubbleFrameMine.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-13.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit

@IBDesignable
class FCTBubbleFrameMine: UIView {

    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 5, y: 5))
        path.addLineToPoint(CGPoint(x: bounds.width - 5, y: 5))
        path.addLineToPoint(CGPoint(x: bounds.width - 5, y: bounds.height - 5))
        path.addLineToPoint(CGPoint(x: 25, y: bounds.height - 5))
        path.addLineToPoint(CGPoint(x: 25, y: 25))
        path.addLineToPoint(CGPoint(x: 5, y: 5))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = UIColor.blueColor().CGColor
        
        self.layer.addSublayer(shapeLayer)
    }

}
