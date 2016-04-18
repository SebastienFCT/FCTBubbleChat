//
//  UIImage+FCTExtension.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-18.
//  Copyright © 2016 sebfct. All rights reserved.
//

import Foundation

extension UIImage {
    func sizeFor(imageView: UIImageView, image: UIImage) -> CGSize {
        let imageViewWidth = imageView.frame.size.width
        let imageViewHeight = imageView.frame.size.height
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        
        if imageViewWidth == imageWidth && imageViewHeight == imageHeight {
            return CGSize(width: imageViewWidth, height: imageViewHeight)
        } else if imageViewWidth > imageWidth && imageViewHeight > imageHeight {
            if imageViewWidth - imageWidth > imageViewHeight - imageHeight {
                return CGSize(width: (imageViewHeight / imageHeight) * imageWidth, height: imageViewHeight)
            } else {
                return CGSize(width: imageViewWidth, height: (imageViewWidth / imageWidth) * imageHeight)
            }
        } else if imageViewWidth < imageWidth && imageViewHeight < imageHeight {
            if imageWidth - imageViewWidth > imageHeight - imageViewHeight {
                return CGSize(width: (imageViewHeight / imageHeight) * imageWidth, height: imageViewHeight)
            } else {
                return CGSize(width: imageViewWidth, height: (imageViewWidth / imageWidth) * imageHeight)
            }
        } else if imageViewWidth < imageWidth && imageViewHeight > imageHeight {
            return CGSize(width: imageViewWidth, height: (imageViewWidth / imageWidth) * imageHeight)
        } else if imageViewWidth > imageWidth && imageViewHeight < imageHeight {
            return CGSize(width: (imageViewHeight / imageHeight) * imageWidth, height: imageViewHeight)
        } else if imageViewWidth == imageWidth {
            return CGSize(width: (imageViewHeight / imageHeight) * imageWidth, height: imageViewHeight)
        } else if imageViewHeight == imageHeight {
            return CGSize(width: imageViewWidth, height: (imageViewWidth / imageWidth) * imageHeight)
        }
        
        return CGSizeZero
        
    }
}