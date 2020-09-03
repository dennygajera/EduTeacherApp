//
//  DiscussionForumViewCommentsVC.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 26/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class DiscussionForumViewCommentsVC: UIViewController {
    @IBOutlet weak var viewCommentsTableView: UITableView!
    @IBOutlet weak var holder_View: UIView!
    
    var sendCommentId = String()
    var getPostID = String()
//    var studentInfo : StudentInfo? = nil
//    var DiscussionForumCommentsModelInfo:  DiscussionForumCommentsModel? = nil
//
//    var likeResponseModel : DiscussionForumLikeModel? = nil
    
    let htmlStart = "<HTML><HEAD><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\"></HEAD><BODY style=background-color: transparent;>"
    
    let htmlEnd = "</BODY></HTML>"
    
    override func viewDidAppear(_ animated: Bool) {
        BasicMethods()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        holder_View.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        holder_View.layer.cornerRadius = 24.0
        holder_View.clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
    }
    fileprivate func BasicMethods() {
        if #available(iOS 13, *) {
            self.overrideUserInterfaceStyle = .light
        }
        
        if let savedPerson = UserDefaults.standard.object(forKey: "studentInfoSaved") as? Data {
            let decoder = JSONDecoder()
//            if let loadedPerson = try? decoder.decode(StudentInfo.self, from: savedPerson) {
//                self.studentInfo = loadedPerson
//                // set profile image to navigation bar
//
//            }
            
        }
        
        viewCommentsTableView.delegate = self
        viewCommentsTableView.dataSource = self
        
//        commentListApi()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "toComments") {
//            let vc = segue.destination as! DiscussionForumViewListSubCommentsVC
//            vc.getCommentID = self.sendCommentId
//        } else if(segue.identifier == "toReply"){
//            let vc = segue.destination as! DiscussionForumCommentReplyVC
//            vc.getCommentId = self.sendCommentId
//        }
//    }
    
}

extension DiscussionForumViewCommentsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //self.DiscussionForumCommentsModelInfo?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscussionForumViewCommentsTVCell", for: indexPath) as! DiscussionForumViewCommentsTVCell
//
//        let data : DiscussionForumCommentsModelResults? =  self.DiscussionForumCommentsModelInfo?.results?[indexPath.row]
//        cell.likeLabel.text =  "\(data?.like_count ?? "0") Likes"
//
//        cell.htmlDataLabel.text = data?.answer?.description.html2Strings
//        cell.dateLabel.text = "\(data?.comment_user?.first_name ?? "") \(data?.comment_user?.last_name ?? "") - \(data?.comment_creation_ago ?? "")"
//        if(data?.comment_user_like == false){
//            cell.btnLike.layer.opacity = 0.5
//        } else {
//            cell.btnLike.layer.opacity = 1
//        }
//
//        cell.cellBGView.borderWidth = 3
//        cell.cellBGView.cornerRadius = 10
//        // For alternate colors
//        if (indexPath.row % 2 == 0)
//        {
//            cell.cellBGView.borderColor = HexColor("#DBF4FC")
//        } else {
//            cell.cellBGView.borderColor = HexColor("#EBFFD5")
//        }
        
//        cell.btnViewReplies.setTitle("\(data?.reply_count ?? 0) View Replies", for: .normal)
//        if(data?.reply_count == 0){
//            cell.btnViewReplies.isEnabled = false
//        } else {
//            cell.btnViewReplies.isEnabled = true
//        }
//
//        cell.btnViewReplies.addTarget(self, action: #selector(btnComments(sender:)), for: .touchUpInside)
//        cell.btnViewReplies.tag = indexPath.row
//
//        cell.btnReply.addTarget(self, action: #selector(btnReply(sender:)), for: .touchUpInside)
//        cell.btnReply.tag = indexPath.row
//
//        cell.btnLike.addTarget(self, action: #selector(btnLike(sender:)), for: .touchUpInside)
//        cell.btnLike.tag = indexPath.row
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    @objc func btnComments(sender: UIButton){
//        let data : DiscussionForumCommentsModelResults? =  self.DiscussionForumCommentsModelInfo?.results?[sender.tag]
//        self.sendCommentId = data?.id?.description ?? ""
//        self.performSegue(withIdentifier: "toComments", sender: self)
//        
//    }
//    
//    @objc func btnReply(sender: UIButton){
//        let data : DiscussionForumCommentsModelResults? =  self.DiscussionForumCommentsModelInfo?.results?[sender.tag]
//        self.sendCommentId = data?.id?.description ?? ""
//        self.performSegue(withIdentifier: "toReply", sender: self)
//        
//        
//    }
//    @objc func btnLike(sender: UIButton){
//        let data : DiscussionForumCommentsModelResults? =  self.DiscussionForumCommentsModelInfo?.results?[sender.tag]
//        
//        self.sendCommentId = data?.id?.description ?? ""
//        giveLikeApi(commentId: self.sendCommentId)
//    }
    
    
}

//MARK:- APi
//extension DiscussionForumViewCommentsVC {
//    func commentListApi(){
//        ProgressHud.sharedProgessHud.showActivityIndicator(uiView: self.view)
//        DiscussionForumApiFetcher.shared.fetchDiscusstionCommentsList(token: studentInfo?.personalInfo?.token ?? "", post_id: getPostID, page_no: "", page_size: "") { (DiscussionForumCommentsModelInfo, err) in
//            self.DiscussionForumCommentsModelInfo = DiscussionForumCommentsModelInfo
//            self.viewCommentsTableView.reloadData()
//            ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//        }
//    }
//    func giveLikeApi(commentId: String){
//            ProgressHud.sharedProgessHud.showActivityIndicator(uiView: view)
//            DiscussionForumApiFetcher.shared.fetchCommentLikeResponse(comment: commentId, token: studentInfo?.personalInfo?.token ?? "") { (DiscussionForumLikeModelInfo, err, status) in
//                ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//                self.likeResponseModel = DiscussionForumLikeModelInfo
//                if let err = err {
//                               //                        print("Student Data: = \(loginInfoModel)")
//                               ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//                               print("Failed to fetch courses:", err)
//
//                               print("Error: \(err.localizedDescription)")
//
//                               Alert.showAlert(on: self, with: "Alert", message: err.localizedDescription)
//                               //
//                               return
//                           }
//                           ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//                           if let status = status {
//                               ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//
//                            self.showAlertOnWindow(title: "Alert", message: status.status ?? "Something went wrong", titles: ["OK"]) { (key) in
//                                if(key == "OK"){
//                                    self.commentListApi()
//                                }
//                            }
//                               print(status.status ?? "Something went wrong")
//                               return
//                           } else {
//                            self.commentListApi()
//                            Alert.showAlert(on: self, with: "Alert", message: "Successfully gave a like")
//                }
//            }
//        }
//}



extension Data {
    var html2AttributedStrings: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2Strings: String { html2AttributedString?.string ?? "" }
}
extension StringProtocol {
    var html2AttributedStrings: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2Strings: String {
        html2AttributedStrings?.string ?? ""
    }
}
