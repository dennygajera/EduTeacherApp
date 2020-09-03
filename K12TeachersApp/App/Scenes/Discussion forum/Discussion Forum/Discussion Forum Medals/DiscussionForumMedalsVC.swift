//
//  DiscussionForumMedalsVC.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 26/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class DiscussionForumMedalsVC: UIViewController {

    @IBOutlet weak var holder_View: UIView!
    @IBOutlet weak var goldImage: UIImageView!
    @IBOutlet weak var silverImage: UIImageView!
    @IBOutlet weak var bronzeImage: UIImageView!
    
    @IBOutlet weak var goldLabelCount: UILabel!
    @IBOutlet weak var silverLabelCount: UILabel!
    @IBOutlet weak var bronzeLabelCount: UILabel!
    
//    var studentInfo : StudentInfo? = nil
//    var DiscussionForumMedalsModelInfo : DiscussionForumMedalsModel? = nil
    var getGoldCount = String()
    var getSilverCount = String()
    var getBronzeCount = String()
    var getPostId = String()
    
    var medalId = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13, *) {
            self.overrideUserInterfaceStyle = .light
        }
        
        if let savedPerson = UserDefaults.standard.object(forKey: "studentInfoSaved") as? Data {
            let decoder = JSONDecoder()
//            if let loadedPerson = try? decoder.decode(StudentInfo.self, from: savedPerson) {
//                self.studentInfo = loadedPerson
                // set profile image to navigation bar
//                noti_imageView.imageFromURL(urlString: self.studentInfo?.student_photo ?? "placeholder")
            }
            
        }

        
//
//        holder_View.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//        holder_View.layer.cornerRadius = 24.0
//        holder_View.clipsToBounds = true
//
//        let goldTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goldImageTapped(tapGestureRecognizer:)))
//        goldImage.isUserInteractionEnabled = true
//        goldImage.addGestureRecognizer(goldTapGestureRecognizer)
//
//        let silverTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(silverImageTapped(tapGestureRecognizer:)))
//        silverImage.isUserInteractionEnabled = true
//        silverImage.addGestureRecognizer(silverTapGestureRecognizer)
//
//        let bronzeTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bronzeImageTapped(tapGestureRecognizer:)))
//        bronzeImage.isUserInteractionEnabled = true
//        bronzeImage.addGestureRecognizer(bronzeTapGestureRecognizer)
//
//        self.goldLabelCount.text = "\(getGoldCount) Gold Medals"
//        self.silverLabelCount.text = "\(getSilverCount) Silver Medals"
//        self.bronzeLabelCount.text = "\(getBronzeCount) Bronze Medals"
//
//        // Do any additional setup after loading the view.
//    }
//    @objc func goldImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
//    {
//        self.medalId = "1"
//        self.goldImage.layer.borderWidth = 1
//        self.goldImage.layer.borderColor = UIColor.black.cgColor
//
//        self.silverImage.layer.borderWidth = 0
//        self.silverImage.layer.borderColor = UIColor.clear.cgColor
//
//        self.bronzeImage.layer.borderWidth = 0
//        self.bronzeImage.layer.borderColor = UIColor.clear.cgColor
//    }
//    @objc func silverImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
//    {
//        self.medalId = "2"
//        self.goldImage.layer.borderWidth = 0
//        self.goldImage.layer.borderColor = UIColor.clear.cgColor
//
//        self.silverImage.layer.borderWidth = 1
//        self.silverImage.layer.borderColor = UIColor.black.cgColor
//
//        self.bronzeImage.layer.borderWidth = 0
//        self.bronzeImage.layer.borderColor = UIColor.clear.cgColor
//    }
//    @objc func bronzeImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
//    {
//        self.medalId = "3"
//        self.goldImage.layer.borderWidth = 0
//        self.goldImage.layer.borderColor = UIColor.clear.cgColor
//
//        self.silverImage.layer.borderWidth = 0
//        self.silverImage.layer.borderColor = UIColor.clear.cgColor
//
//        self.bronzeImage.layer.borderWidth = 1
//        self.bronzeImage.layer.borderColor = UIColor.black.cgColor
//    }
//    @IBAction func btnPostMedal(_ sender: Any) {
//        if(medalId == "") {
//            Alert.showAlert(on: self, with: "Alert", message: "Select a medal")
//        } else {
//            postMedalApi()
//        }
//    }
    
    
    
}
//extension DiscussionForumMedalsVC {
//    func postMedalApi(){
//        ProgressHud.sharedProgessHud.showActivityIndicator(uiView: self.view)
//        DiscussionForumApiFetcher.shared.fetchMedalResponse(awardId: medalId, postId: getPostId, token: studentInfo?.personalInfo?.token ?? "") { (DiscussionForumMedalsModelInfo, err, status) in
//            ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//            self.DiscussionForumMedalsModelInfo = DiscussionForumMedalsModelInfo
//
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
//            if let status = status {
//                ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: self.view)
//                Alert.showAlert(on: self, with: "Alert", message: status.status ?? "Something went wrong")
//                print(status.status ?? "Something went wrong")
//
//                return
//            } else {
//                self.showAlertOnWindow(title: "Success", message: "Successfully added medal", titles: ["OK"]) { (key) in
//                    if(key == "OK"){
//                        self.navigationController?.popViewController(animated: true)
//                    }
//                }
//            }
//        }
//    }
//}
