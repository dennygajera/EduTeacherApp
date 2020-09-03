//
//  DiscussionForumCommentReplyVC.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 28/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class DiscussionForumCommentReplyVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var replyTF: UITextField!
//    var studentInfo : StudentInfo? = nil
//    var getCommentId = String()
//    var DiscussionReplyToCommentModelInfo : DiscussionReplyToCommentModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        replyTF.delegate = self
        if #available(iOS 13, *) {
            self.overrideUserInterfaceStyle = .light
        }
        
        if let savedPerson = UserDefaults.standard.object(forKey: "studentInfoSaved") as? Data {
            let decoder = JSONDecoder()
//            if let loadedPerson = try? decoder.decode(StudentInfo.self, from: savedPerson) {
//                self.studentInfo = loadedPerson
                // set profile image to navigation bar
                
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func btnPost(_ sender: Any) {
//        if replyTF.text != "" {
//            replyToComment()
//        } else {
////            Alert.showAlert(on: self, with: "Alert", message: "The comment box is empty.")
//        }
//    }
    
//}
//extension DiscussionForumCommentReplyVC {
//    func replyToComment(){
//        ProgressHud.sharedProgessHud.showActivityIndicator(uiView: self.view)
//        DiscussionForumApiFetcher.shared.fetchReplyCommentResponse(answer: replyTF.text!, comment_fk: getCommentId, token: studentInfo?.personalInfo?.token ?? "") { (DiscussionReplyToCommentModelInfo, err) in
//            ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//            self.DiscussionReplyToCommentModelInfo = DiscussionReplyToCommentModelInfo
//            if let err = err {
//                //                        print("Student Data: = \(loginInfoModel)")
//                ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//                print("Failed to fetch courses:", err)
//
//                print("Error: \(err.localizedDescription)")
//
//                Alert.showAlert(on: self, with: "Alert", message: err.localizedDescription)
//                //
//                return
//            }
//            ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//                self.dismiss(animated: true, completion: nil)
//            }
//        }
//    }

