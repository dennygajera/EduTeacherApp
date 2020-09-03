//
//  DiscussionForumCreatePostEditorVC.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 26/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class DiscussionForumCreatePostEditorVC: UIViewController {

    @IBOutlet weak var holder_View: UIView!
    
    var getCategoryName = String()
    var getSubCatName = String()
    var getSubSubCatName = String()
    var getTitleName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        holder_View.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        holder_View.layer.cornerRadius = 24.0
        holder_View.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

}
