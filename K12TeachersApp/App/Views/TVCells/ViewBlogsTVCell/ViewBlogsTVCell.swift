//
//  ViewBlogsTVCell.swift
//  K12TeachersApp
//
//  Created by Santosh on 24/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class ViewBlogsTVCell: UITableViewCell {
    
    @IBOutlet weak var holderview: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var blogTitleLabel: UILabel!
    @IBOutlet weak var blogAuthorNameLabel: UILabel!
    @IBOutlet weak var blogGenereTypeLabel: UILabel!
    @IBOutlet weak var blogTimeLabel: UILabel!
    @IBOutlet weak var blogDateLabel: UILabel!
    @IBOutlet weak var blogNoLikeButton: UIButton!
    @IBOutlet weak var blogLikeButton: UIButton!
    var df = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateUI()
    }
    
    func updateUI() {
        holderview.appDefaultCornerRadius()
        holderview.applyDefaultShadow()
        avatarImageView.applyTopCornerRadius()
        blogTitleLabel.font = UIFont.appMainTitleFont
        blogTitleLabel.textColor = UIColor.appMainTitleColor
        blogAuthorNameLabel.font = UIFont.appUserNameFont
        blogAuthorNameLabel.textColor = UIColor.appAuthorTitleColor
        blogGenereTypeLabel.font = UIFont.appSubTitleFont
        blogGenereTypeLabel.textColor = UIColor.appSubTitleColor
        blogDateLabel.font = UIFont.appSubTitleFont
        blogDateLabel.textColor = UIColor.appSubTitleColor
        blogTimeLabel.font = UIFont.appSubTitleFont
        blogTimeLabel.textColor = UIColor.appSubTitleColor
        
        blogNoLikeButton.setTitleColor(UIColor.appSubTitleColor, for: [])
        blogNoLikeButton.titleLabel?.font = UIFont.appSubTitleFont
    }
    
    var blogItem: ViewBlogsData? {
        didSet {
            avatarImageView.imageFromURL(urlString: blogItem?.thumbnail ?? "")
            blogTitleLabel.text = blogItem?.title
            blogAuthorNameLabel.text = blogItem?.author?.student?.name
            
            let genreType: String?
            if blogItem?.genre?.genre_subtype != nil {
                genreType = "\(blogItem?.genre?.genre ?? "")(\(blogItem?.genre?.genre_subtype ?? ""))"
            }else {
                genreType = blogItem?.genre?.genre ?? ""
            }
            
            df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
            let dateFromServer = df.date(from: blogItem?.created_at ?? "")
            df.dateFormat = "dd.MM.yyyy"
            let dateString = df.string(from: dateFromServer!)
            blogDateLabel.text = dateString
            df.dateFormat = "hh:mm a"
            let timeString = df.string(from: dateFromServer!)
            blogTimeLabel.text = timeString
            
            blogGenereTypeLabel.attributedText = attributedText(string1: "Genre: ", string2: "\(genreType ?? "")")
            
            blogNoLikeButton.setTitle("\(blogItem?.likes?.description ?? "0") Likes", for: [])
        }
    }
    
    
    @IBAction func likeButtonTapped(_ sender: Any) {
    }
    
    
    
}
