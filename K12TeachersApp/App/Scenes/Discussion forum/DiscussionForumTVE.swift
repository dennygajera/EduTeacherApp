//
//  DiscussionForumTVE.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services on 28/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
extension DiscussionForumVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        return self.discussionForumPostListresults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscussionForumTVCell", for: indexPath) as! DiscussionForumTVCell
        let data : DiscussionForumPostListModelResults? = self.discussionForumPostListresults?[indexPath.row]
        cell.categoryLabel.text = data?.category?.title ?? "-NA-"
        cell.subtypeLabel.text = data?.sub_category?.title ?? "-NA-"
        cell.subSubTypeLabel.text = data?.sub_sub_category?.title ?? "-NA-"
        cell.userNameLabel.text = "\(data?.post_user?.first_name ?? "") \(data?.post_user?.last_name ?? "")"
        cell.dateLabel.text = data?.post_creation_ago ?? "-NA-"
        cell.titleLabel.text = "Title - \(data?.title ?? "-NA-")\nDescription - \(data?.description?.description.html2Strings ?? "-NA-")"
        cell.likeLabel.text = "\(data?.like_count ?? "0") Likes"
        cell.commentLabel.text = "\(data?.comment_count ?? "0") Answers"

        if(data?.comment_count == "0"){
            cell.btnComments.isEnabled = false
            cell.btnComments.layer.opacity = 0.5
        } else {
            cell.btnComments.isEnabled = true
            cell.btnComments.layer.opacity = 1
        }

        let gold_Count = data?.gold_count ?? 0
        let silver_count = data?.silver_count ?? 0
        let bronze_count = data?.bronze_count ?? 0
        let medalCount = Int(gold_Count + silver_count + bronze_count)
        cell.medalsLabel.text = "\(medalCount) Medals"

//        cell.btnViewPost.addTarget(self, action: #selector(btnViewPost(sender:)), for: .touchUpInside)
//        cell.btnViewPost.tag = indexPath.row
//
//        cell.btnComments.addTarget(self, action: #selector(btnComments(sender:)), for: .touchUpInside)
//        cell.btnComments.tag = indexPath.row
//
//        cell.btnMedals.addTarget(self, action: #selector(btnMedals(sender:)), for: .touchUpInside)
//        cell.btnMedals.tag = indexPath.row
//
//        cell.btnLike.addTarget(self, action: #selector(btnLike(sender:)), for: .touchUpInside)

        if(data?.user_like == false){

            cell.btnLike.layer.opacity = 0.5
        } else {

            cell.btnLike.layer.opacity = 1
        }

        cell.cellBGView.borderWidth = 2
        if (indexPath.row % 2 == 0)
        {
            cell.cellBGView.borderColor = HexColor("#DBF4FC")
            cell.userNameBGView.backgroundColor = HexColor("#DBF4FC")
        } else {
            cell.cellBGView.borderColor = HexColor("#EBFFD5")
            cell.userNameBGView.backgroundColor = HexColor("#EBFFD5")
        }

        let comparerowindex = (self.discussionForumPostListresults?.count ?? 1) - 2
                    if  (comparerowindex == indexPath.row) {
                        self.refresh()
                    }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    @objc func btnViewPost(sender: UIButton){
//        let data : DiscussionForumPostListModelResults? = self.discussionForumPostList?.results?[sender.tag]
//
//        self.sendPostDetails = data
//
//        self.performSegue(withIdentifier: "toPost", sender: self)
//    }
    
//    @objc func btnComments(sender: UIButton){
//
//        let data : DiscussionForumPostListModelResults? = self.discussionForumPostList?.results?[sender.tag]
//        self.postId = data?.id?.description ?? ""
//        self.performSegue(withIdentifier: "toComments", sender: self)
//    }
    
//    @objc func btnMedals(sender: UIButton){
//
//           let data : DiscussionForumPostListModelResults? = self.discussionForumPostList?.results?[sender.tag]
//        self.goldCount = data?.gold_count ?? 0
//        self.silverCount = data?.silver_count ?? 0
//        self.bronzeCount = data?.bronze_count ?? 0
//           self.postId = data?.id?.description ?? ""
//           self.performSegue(withIdentifier: "toMedals", sender: self)
//       }
    
    //MARK: Download pdf
//    @objc func btnLike(sender: UIButton)
//    {
//        let getIndex: CGPoint = sender.convert(CGPoint.zero, to: discussionForumTableView)
//        let indexPath = discussionForumTableView!.indexPathForRow(at: getIndex)
//        let cell = discussionForumTableView.cellForRow(at: indexPath!) as! DiscussionForumTVCell
//        let data : DiscussionForumPostListModelResults? = self.discussionForumPostList?.results?[indexPath?.row ?? 0]
//
//        self.giveLikeApi(postId: data?.id?.description ?? "")
//
////        let Like = Int(data?.like_count ?? "0") ?? 0
////        let likeCount = Int(Like + 1)
////        cell.likeLabel.text = "\(likeCount) Likes"
////        cell.btnLike.isEnabled = false
//    }
    
}

