//
//  SingleAssignmentTableViewCell.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/15/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit

class SingleAssignmentTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var IsAchievedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        //corner-radius
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
