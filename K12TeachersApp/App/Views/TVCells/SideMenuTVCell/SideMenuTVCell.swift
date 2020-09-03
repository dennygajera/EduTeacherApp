//
//  SideMenuTVCell.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class SideMenuTVCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var sideMenuItem : SideMenuModel? {
        didSet {
            avatarImageView.image = UIImage(named: sideMenuItem?.sideMenu_image ?? "")
            titleLabel.text = sideMenuItem?.sideMenu_Name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.appMainTitleFont
        titleLabel.textColor = UIColor.appMainTitleColor
    }
}
