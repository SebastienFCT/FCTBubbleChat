//
//  FCTBubbleFrameOther.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-15.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit

@IBDesignable
public class FCTBubbleFrameOther: UIView {
    
    @IBInspectable var bubbleColor: UIColor = UIColor(red: 244/255.0, green: 198/255.0, blue: 211/255.0, alpha: 1.0)
    @IBInspectable public var text: String = "hello world!"
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: bounds.width - 5, y: 5))
        path.addLineToPoint(CGPoint(x: bounds.width - 25, y: 25))
        path.addLineToPoint(CGPoint(x: bounds.width - 25, y: bounds.height - 5))
        path.addLineToPoint(CGPoint(x: 5, y: bounds.height - 5))
        path.addLineToPoint(CGPoint(x: 5, y: 5))
        path.addLineToPoint(CGPoint(x: bounds.width - 5, y: 5))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = bubbleColor.CGColor
        
        self.layer.addSublayer(shapeLayer)
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: bounds.width - 60, height: bounds.height - 40))
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont(name: "HiraKakuProN-W3", size: 20.0)
        label.textColor = UIColor.blueColor()
        label.backgroundColor = UIColor.clearColor()
        
        self.addSubview(label)
    }
}
