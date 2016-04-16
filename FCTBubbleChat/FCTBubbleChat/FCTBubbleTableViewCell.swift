//
//  FCTBubbleTableViewCell.swift
//  FCTBubbleChat
//
//  Created by sebastien FOCK CHOW THO on 2016-04-14.
//  Copyright © 2016 sebfct. All rights reserved.
//

import UIKit

public class FCTBubbleTableViewCell: UITableViewCell {
    
    @IBOutlet var bubbleFrame: FCTBubbleFrame!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
