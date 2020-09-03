//
//  HomeTVCell.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class HomeTVCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.font = UIFont.appMainTitleFont
        nameLabel.textColor = UIColor.appMainTitleColor
        // Initialization code
    }
    var item : String? {
        didSet {
            nameLabel.text = item
        }
    }
}
