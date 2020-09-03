//
//  DiscussionForumTVCell.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 25/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class DiscussionForumTVCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var subtypeLabel: UILabel!
    @IBOutlet weak var subSubTypeLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var btnComments: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var btnMedals: UIButton!
    @IBOutlet weak var medalsLabel: UILabel!
    @IBOutlet weak var btnViewPost: UIButton!
    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var userNameBGView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnLike.layer.opacity = 0.5
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
