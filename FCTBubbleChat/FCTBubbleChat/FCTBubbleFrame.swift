//
//  FCTBubbleFrame.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-15.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit

@IBDesignable
public class FCTBubbleFrame: UIView {
    
    var bubbleColor: UIColor = UIColor(red: 0/255.0, green: 166/255.0, blue: 186/255.0, alpha: 1.0)
    public var text: String = "hello world!"
    
    // Custom
    public var picMode: Bool = true
    public var bubbleType: FCTBubbleDataType = .Other
    public var avatarPic: UIImage?
    public var username: String = "Username"
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let path = UIBezierPath()
        
        let shapeLayer = CAShapeLayer()
        
        let label: UILabel = UILabel()
        let usernameLabel: UILabel = UILabel()
        
        switch bubbleType {
        case .Mine:
            bubbleColor = UIColor(red: 0/255.0, green: 166/255.0, blue: 186/255.0, alpha: 1.0)
            
            if picMode {
                let avatar = UIImageView(frame: CGRect(x: 5, y: 5, width: 60, height: 60))
                avatar.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
                avatar.layer.borderColor = UIColor.whiteColor().CGColor
                avatar.layer.borderWidth = 2.0
                avatar.layer.cornerRadius = 20
                
                self.addSubview(avatar)
                
                usernameLabel.frame = CGRect(x: 80, y: 5, width: bounds.width - 90, height: 25)
                usernameLabel.textColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
                
                self.addSubview(usernameLabel)
                
                path.moveToPoint(CGPoint(x: 80, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 5, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 5, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 100, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 100, y: 55))
                path.addLineToPoint(CGPoint(x: 80, y: 35))
                
                label.frame = CGRect(x: 115, y: 50, width: bounds.width - 135, height: bounds.height - 70)
            } else {
                usernameLabel.frame = CGRect(x: 5, y: 5, width: bounds.width - 10, height: 25)
                usernameLabel.textColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
                
                self.addSubview(usernameLabel)
                
                path.moveToPoint(CGPoint(x: 5, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 50, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 50, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 25, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 25, y: 55))
                path.addLineToPoint(CGPoint(x: 5, y: 35))
                
                label.frame = CGRect(x: 40, y: 50, width: bounds.width - 105, height: bounds.height - 70)
            }
        case .Other:
            bubbleColor = UIColor(red: 244/255.0, green: 198/255.0, blue: 211/255.0, alpha: 1.0)
            
            if picMode {
                let avatar = UIImageView(frame: CGRect(x: bounds.width - 65, y: 5, width: 60, height: 60))
                avatar.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
                avatar.layer.borderColor = UIColor.whiteColor().CGColor
                avatar.layer.borderWidth = 2.0
                avatar.layer.cornerRadius = 20
                
                self.addSubview(avatar)
                
                usernameLabel.frame = CGRect(x: 5, y: 5, width: bounds.width - 85, height: 25)
                usernameLabel.textColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
                usernameLabel.textAlignment = .Right
                
                self.addSubview(usernameLabel)
                
                path.moveToPoint(CGPoint(x: bounds.width - 75, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 95, y: 55))
                path.addLineToPoint(CGPoint(x: bounds.width - 95, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 5, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 5, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 75, y: 35))
                
                label.frame = CGRect(x: 20, y: 50, width: bounds.width - 130, height: bounds.height - 70)
            } else {
                usernameLabel.frame = CGRect(x: 5, y: 5, width: bounds.width - 10, height: 25)
                usernameLabel.textColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
                usernameLabel.textAlignment = .Right
                
                self.addSubview(usernameLabel)
                
                path.moveToPoint(CGPoint(x: bounds.width - 5, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 25, y: 55))
                path.addLineToPoint(CGPoint(x: bounds.width - 25, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 50, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 50, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 5, y: 35))
                
                label.frame = CGRect(x: 65, y: 50, width: bounds.width - 105, height: bounds.height - 70)
            }
        }
        
        usernameLabel.text = username
        
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont(name: "HiraKakuProN-W3", size: 20.0)
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        
        shapeLayer.path = path.CGPath
        
        let shadowPath: UIBezierPath = UIBezierPath(rect: self.bounds)
        self.layer.masksToBounds = false;
        self.layer.shadowColor = UIColor.blackColor().CGColor;
        self.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        self.layer.shadowOpacity = 0.3;
        
        shapeLayer.shadowPath = shadowPath.CGPath
        
        shapeLayer.fillColor = bubbleColor.CGColor
        
        self.layer.addSublayer(shapeLayer)
        self.addSubview(label)
    }
}
