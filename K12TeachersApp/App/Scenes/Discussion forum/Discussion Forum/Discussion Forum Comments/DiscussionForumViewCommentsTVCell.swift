//
//  DiscussionForumViewCommentsTVCell.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 26/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit
//import WebKit
class DiscussionForumViewCommentsTVCell: UITableViewCell {
//    @IBOutlet weak var viewCommentWebView: WKWebView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var btnReply: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var htmlDataLabel: UILabel!
    
    @IBOutlet weak var btnViewReplies: UIButton!
    @IBOutlet weak var cellBGView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
