//
//  FCTBubbleFrameMine.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-13.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit

@IBDesignable
public class FCTBubbleFrameMine: UIView {
    
    @IBInspectable var bubbleColor: UIColor = UIColor(red: 0/155.0, green: 166/155.0, blue: 186/155.0, alpha: 1.0)
    @IBInspectable public var text: String = "hello world!"

    override public func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 5, y: 5))
        path.addLineToPoint(CGPoint(x: bounds.width - 5, y: 5))
        path.addLineToPoint(CGPoint(x: bounds.width - 5, y: bounds.height - 5))
        path.addLineToPoint(CGPoint(x: 25, y: bounds.height - 5))
        path.addLineToPoint(CGPoint(x: 25, y: 25))
        path.addLineToPoint(CGPoint(x: 5, y: 5))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = bubbleColor.CGColor
        
        self.layer.addSublayer(shapeLayer)
        
        let labelLayer = CATextLayer()
        labelLayer.frame = CGRect(x: 40, y: 20, width: bounds.width - 80, height: bounds.height - 40)
        labelLayer.string = text
        labelLayer.fontSize = 20.0
        labelLayer.foregroundColor = UIColor.blackColor().CGColor

        self.layer.addSublayer(labelLayer)
    }
}
