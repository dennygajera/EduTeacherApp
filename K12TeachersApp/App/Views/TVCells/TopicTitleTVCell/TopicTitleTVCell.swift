//
//  TopicTitleTVCell.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class TopicTitleTVCell: UITableViewCell {

    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var topicTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        holderView.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.9411764706, blue: 0.937254902, alpha: 1)
        holderView.applyDefaultShadow()
        holderView.appDefaultCornerRadius()
        topicTitleLabel.textColor = UIColor.appMainTitleColor
        topicTitleLabel.font = UIFont.appNavigationTitleFont
        
    }
    
    var topicTitle: String? {
        didSet {
            topicTitleLabel.text = topicTitle
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
