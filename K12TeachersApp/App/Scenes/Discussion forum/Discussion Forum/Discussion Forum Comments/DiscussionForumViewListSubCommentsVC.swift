//
//  DiscussionForumViewListSubCommentsVC.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 27/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class DiscussionForumViewListSubCommentsVC: UIViewController {

    @IBOutlet weak var holder_View: UIView!
    @IBOutlet weak var replyTableView: UITableView!
    
//    var DiscussionForumReplyListsModelInfo : [DiscussionForumReplySubListsModel]? = nil
//    var studentInfo : StudentInfo? = nil
//    var getCommentID = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        holder_View.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        holder_View.layer.cornerRadius = 24.0
        holder_View.clipsToBounds = true
        BasicMethods()
//        subReplyListApi()
    }
    fileprivate func BasicMethods() {
              if #available(iOS 13, *) {
                  self.overrideUserInterfaceStyle = .light
              }
              
              if let savedPerson = UserDefaults.standard.object(forKey: "studentInfoSaved") as? Data {
                  let decoder = JSONDecoder()
//                  if let loadedPerson = try? decoder.decode(StudentInfo.self, from: savedPerson) {
//                      self.studentInfo = loadedPerson
                      // set profile image to navigation bar
//                      noti_imageView.imageFromURL(urlString: self.studentInfo?.student_photo ?? "placeholder")
                  }
                  
              }
//       }
}
extension DiscussionForumViewListSubCommentsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
//        return self.DiscussionForumReplyListsModelInfo?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscussionForumViewListSubCommentsTVCell", for: indexPath) as! DiscussionForumViewListSubCommentsTVCell
//        let data : DiscussionForumReplySubListsModel? = self.DiscussionForumReplyListsModelInfo?[indexPath.row]
//
//        cell.commentLabel.text = "\(data?.answer?.description.html2Strings ?? "") by \(data?.reply_user?.first_name ?? "") \(data?.reply_user?.last_name ?? "") on \(data?.replay_creation_ago ?? "")"
//        cell.bgView.cornerRadius = 10
//        cell.bgView.borderWidth = 3
//        // For alternate colors
//               if (indexPath.row % 2 == 0)
//               {
//                   cell.bgView.borderColor = HexColor("#DBF4FC")
//               } else {
//                   cell.bgView.borderColor = HexColor("#EBFFD5")
//               }
//
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//extension DiscussionForumViewListSubCommentsVC {
//
//    func subReplyListApi(){
//        ProgressHud.sharedProgessHud.showActivityIndicator(uiView: self.view)
//        DiscussionForumApiFetcher.shared.fetchDiscusstionListReply(token: studentInfo?.personalInfo?.token ?? "", comment_id: getCommentID) { (DiscussionForumReplySubListsModelInfo, err) in
//            ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//            self.DiscussionForumReplyListsModelInfo = DiscussionForumReplySubListsModelInfo
//            self.replyTableView.reloadData()
//        }
//    }
//
//}
