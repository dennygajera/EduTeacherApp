//
//  DiscussionForumViewPostTVCell.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 26/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit
import WebKit
class DiscussionForumViewPostTVCell: UITableViewCell {

    @IBOutlet weak var postWebView: WKWebView!
//    @IBOutlet weak var commentTF: FloatingLabelTextField!
    @IBOutlet weak var btnPost: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
