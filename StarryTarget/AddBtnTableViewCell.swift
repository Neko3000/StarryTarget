//
//  AddBtnTableViewCell.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/22/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit

protocol SegueBehaviorObject:NSObjectProtocol{
    func SegueToAnotherScreen()->Void;
}

class AddBtnTableViewCell: UITableViewCell {
    
    //A variable provided to outside for calling
    public var ViewControllerWithSegueBehavior:SegueBehaviorObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func AddBtnTouchUpInside(_ sender: Any) {
        ViewControllerWithSegueBehavior?.SegueToAnotherScreen()
    }
}
