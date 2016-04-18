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
    
    private var bubbleColor: UIColor = UIColor(red: 0/255.0, green: 166/255.0, blue: 186/255.0, alpha: 1.0)

    // * Text
    internal var text: String = ""
    internal var textFont: UIFont = UIFont(name: "HiraKakuProN-W3", size: 20.0)!
    internal var textColor: UIColor = UIColor.whiteColor()
    internal var avatarColor: UIColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
    internal var avatarFont = UIFont(name: "HiraKakuProN-W3", size: 15.0)!
    internal var textBackgroundColor: UIColor = UIColor.clearColor()
    // * Image
    internal var imageContent: UIImage?
    // * Shadow
    internal var displayShadow: Bool = true
    // * Avatar
    public var picMode: Bool = false
    public var avatarPic: UIImage?
    // * Other
    internal var bubbleType: FCTBubbleDataType = .Mine
    internal var contentType: FCTBubbleContentType = .Text
    internal var username: String = "Unknown"
    internal var bubbleMineColor: UIColor = UIColor(red: 0/255.0, green: 166/255.0, blue: 186/255.0, alpha: 1.0)
    internal var bubbleOtherColor: UIColor = UIColor(red: 244/255.0, green: 198/255.0, blue: 211/255.0, alpha: 1.0)
    
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let path = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        
        let contentFrame: CGRect
        let label: UILabel?
        let image: UIImageView?
        let usernameLabel: UILabel = UILabel()
        
        switch bubbleType {
        case .Mine:
            bubbleColor = bubbleMineColor
            
            if picMode {
                let avatar = UIImageView(frame: CGRect(x: 5, y: 5, width: 60, height: 60))
                avatar.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
                avatar.layer.cornerRadius = 20
                avatar.layer.masksToBounds = true
                
                if avatarPic != nil {
                    avatar.image = avatarPic!
                    avatar.contentMode = .ScaleAspectFit
                }
                
                self.addSubview(avatar)
                
                usernameLabel.frame = CGRect(x: 80, y: 5, width: bounds.width - 90, height: 25)
                
                path.moveToPoint(CGPoint(x: 80, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 5, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 5, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 100, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 100, y: 55))
                path.addLineToPoint(CGPoint(x: 80, y: 35))
                
                contentFrame = CGRect(x: 115, y: 50, width: bounds.width - 135, height: bounds.height - 70)
            } else {
                usernameLabel.frame = CGRect(x: 5, y: 5, width: bounds.width - 10, height: 25)
                
                path.moveToPoint(CGPoint(x: 5, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 50, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 50, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 25, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 25, y: 55))
                path.addLineToPoint(CGPoint(x: 5, y: 35))
                
                contentFrame = CGRect(x: 40, y: 50, width: bounds.width - 105, height: bounds.height - 70)
            }
        case .Other:
            bubbleColor = bubbleOtherColor
            
            if picMode {
                let avatar = UIImageView(frame: CGRect(x: bounds.width - 65, y: 5, width: 60, height: 60))
                avatar.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
                avatar.layer.cornerRadius = 20
                avatar.layer.masksToBounds = true
                
                if avatarPic != nil {
                    avatar.image = avatarPic!
                    avatar.contentMode = .ScaleAspectFit
                }
                
                self.addSubview(avatar)
                
                usernameLabel.frame = CGRect(x: 5, y: 5, width: bounds.width - 85, height: 25)

                path.moveToPoint(CGPoint(x: bounds.width - 75, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 95, y: 55))
                path.addLineToPoint(CGPoint(x: bounds.width - 95, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 5, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 5, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 75, y: 35))
                
                contentFrame = CGRect(x: 20, y: 50, width: bounds.width - 130, height: bounds.height - 70)
            } else {
                usernameLabel.frame = CGRect(x: 5, y: 5, width: bounds.width - 10, height: 25)
                
                path.moveToPoint(CGPoint(x: bounds.width - 5, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 25, y: 55))
                path.addLineToPoint(CGPoint(x: bounds.width - 25, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 50, y: bounds.height - 5))
                path.addLineToPoint(CGPoint(x: 50, y: 35))
                path.addLineToPoint(CGPoint(x: bounds.width - 5, y: 35))
                
                contentFrame = CGRect(x: 65, y: 50, width: bounds.width - 105, height: bounds.height - 70)
            }
            
            usernameLabel.textAlignment = .Right
        }
        
        usernameLabel.text = username
        usernameLabel.font = avatarFont
        usernameLabel.textColor = avatarColor
        
        self.addSubview(usernameLabel)
        
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = bubbleColor.CGColor
        
        self.layer.addSublayer(shapeLayer)
        
        switch contentType {
        case .Text:
            label = UILabel(frame: contentFrame)
            label!.text = text
            label!.numberOfLines = 0
            label!.font = textFont
            label!.textColor = textColor
            label!.backgroundColor = textBackgroundColor
            
            self.addSubview(label!)
        case .Image:
            image = UIImageView(frame: contentFrame)
            image!.contentMode = .ScaleAspectFit
            image!.image = imageContent != nil ? imageContent : UIImage()
            
            self.addSubview(image!)
        }
        
        if displayShadow {
            let shadowPath: UIBezierPath = UIBezierPath(rect: self.bounds)
            self.layer.masksToBounds = false;
            self.layer.shadowColor = UIColor.blackColor().CGColor;
            self.layer.shadowOffset = CGSizeMake(0.5, 0.5);
            self.layer.shadowOpacity = 0.3;
            
            shapeLayer.shadowPath = shadowPath.CGPath
        }
    }
}
