//
//  DiscussionForumCreatePostVC.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 25/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class DiscussionForumCreatePostVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var holder_View: UIView!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var subCategoryTF: UITextField!
    @IBOutlet weak var subSubCategoryTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
//
//    var studentInfo : StudentInfo? = nil
//    var discussionForumCategoryList : [DiscussionForumCategoryModel]? = nil
//    var discussionForumSubCategoryList : [DiscussionForumCategoryModel]? = nil
//    var discussionForumSubSubCategoryList : [DiscussionForumCategoryModel]? = nil
    
    var categoryList = String()
    var categoryListId = String()
    
    var subCategoryList = String()
    var subCategoryListId = String()
    
    var categoryPicker = UIPickerView()
    var categoryToolBar = UIToolbar()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        holder_View.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        holder_View.layer.cornerRadius = 24.0
        holder_View.clipsToBounds = true
//        pickerFun()
        BasicMethods()
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func BasicMethods() {
        if #available(iOS 13, *) {
            self.overrideUserInterfaceStyle = .light
        }
}
}
        
//        if let savedPerson = UserDefaults.standard.object(forKey: "studentInfoSaved") as? Data {
//            let decoder = JSONDecoder()
//            if let loadedPerson = try? decoder.decode(StudentInfo.self, from: savedPerson) {
//                self.studentInfo = loadedPerson
//            }
//
//        }
//        self.fetchCategoryListApi()
//    }
//
//    @IBAction func btnNext(_ sender: Any) {
//
//        if((categoryTF.text != "") && (titleTF.text != "")){
//            self.performSegue(withIdentifier: "toEditor", sender: self)
//        } else {
//            Alert.showAlert(on: self, with: "Alert", message: "Category and title are important.")
//        }
//    }
    
//    //MARK: Picker Functions
//    func pickerFun(){
//
//        categoryPicker.delegate = self
//        categoryPicker.dataSource = self
//
//        let categoryDoneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(categoryDone))
//        let categorySpcBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//        let categoryCancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(categoryCancel))
//        categoryToolBar.setItems([categoryCancelBtn, categorySpcBtn ,categoryDoneBtn], animated: true)
//        categoryToolBar.isUserInteractionEnabled = true
//        categoryToolBar.isTranslucent = true
//        categoryToolBar.sizeToFit()
//        categoryTF.inputView = categoryPicker
//        categoryTF.inputAccessoryView = categoryToolBar
//
//        subCategoryTF.inputView = categoryPicker
//        subCategoryTF.inputAccessoryView = categoryToolBar
//
//        subSubCategoryTF.inputView = categoryPicker
//        subSubCategoryTF.inputAccessoryView = categoryToolBar
//
//        categoryToolBar.barStyle = .default
//        categoryToolBar.isTranslucent = true
//        categoryToolBar.sizeToFit()
//        categoryToolBar.tintColor = .black
//        categoryToolBar.backgroundColor = .darkGray
//    }
//
//    @objc func categoryDone(){
//        if(categoryTF.isFirstResponder){
//            categoryTF.resignFirstResponder()
//            fetchSubCategoryListApi(category_id: categoryListId)
//        } else if(subCategoryTF.isFirstResponder){
//            subCategoryTF.resignFirstResponder()
//            fetchSubSubCategoryListApi(category_id: categoryListId, sub_category_id: subCategoryListId)
//        } else {
//            subSubCategoryTF.resignFirstResponder()
//        }
//
//    }
//
//    @objc func categoryCancel(){
//        if(categoryTF.isFirstResponder){
//            categoryTF.resignFirstResponder()
//        } else if(subCategoryTF.isFirstResponder){
//            subCategoryTF.resignFirstResponder()
//        } else {
//            subSubCategoryTF.resignFirstResponder()
//        }
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "toEditor"){
//            let vc = segue.destination as! DiscussionForumCreatePostEditorVC
//            vc.getTitleName = self.titleTF.text!
//            vc.getCategoryName = self.categoryTF.text!
//            vc.getSubCatName = self.subCategoryTF.text ?? ""
//            vc.getSubSubCatName = self.subSubCategoryTF.text ?? ""
//
//        }
//    }
//
//
//}
//extension DiscussionForumCreatePostVC {
//    func fetchCategoryListApi(){
//
//        DiscussionForumApiFetcher.shared.fetchDiscusstionListCategory(token: studentInfo?.personalInfo?.token ?? "", grade_id: studentInfo?.grade_id?.description ?? "") { (DiscussionForumCategoryListInfo, error) in
//
//            self.discussionForumCategoryList = DiscussionForumCategoryListInfo
//        }
//    }
//
//    func fetchSubCategoryListApi(category_id: String){
//
//        DiscussionForumApiFetcher.shared.fetchDiscusstionListSubCategory(token: studentInfo?.personalInfo?.token ?? "", category_id: category_id) { (DiscussionForumCategoryListInfo, error) in
//
//            self.discussionForumSubCategoryList = DiscussionForumCategoryListInfo
//
//            if(self.discussionForumSubCategoryList?.count == 0){
//                self.subCategoryTF.isHidden = true
//                self.subSubCategoryTF.isHidden = true
//            } else {
//                self.subCategoryTF.isHidden = false
//                self.subSubCategoryTF.isHidden = true
//            }
//
//
//        }
//    }
//
////    func fetchSubSubCategoryListApi(category_id: String, sub_category_id: String){
////
////        DiscussionForumApiFetcher.shared.fetchDiscusstionListSubSubCategory(token: studentInfo?.personalInfo?.token ?? "", category_id: category_id, sub_category_id: sub_category_id) { (DiscussionForumCategoryListInfo, error) in
////
////            self.discussionForumSubSubCategoryList = DiscussionForumCategoryListInfo
////
////            if(self.discussionForumSubSubCategoryList?.count == 0){
//////                self.subCategoryTF.isHidden = true
////                self.subSubCategoryTF.isHidden = true
////            } else {
//////                self.subCategoryTF.isHidden = false
////                self.subSubCategoryTF.isHidden = false
////            }
////
////        }
////    }
//
//
//}
//extension DiscussionForumCreatePostVC: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
////    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
////
////        if(categoryTF.isFirstResponder){
////            return self.discussionForumCategoryList?.count ?? 0
////        } else if(subCategoryTF.isFirstResponder){
////            return self.discussionForumSubCategoryList?.count ?? 0
////        } else {
////            return 0
////        }
////
////
////    }
////
////    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
////        if(categoryTF.isFirstResponder) {
////            return self.discussionForumCategoryList?[row].title
////        } else {
////            return self.discussionForumSubCategoryList?[row].title
////        }
////
////    }
////    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
////
////        if(categoryTF.isFirstResponder) {
////            self.categoryList = self.discussionForumCategoryList?[row].title ?? ""
////            categoryTF.text = self.categoryList
////            self.categoryListId = self.discussionForumCategoryList?[row].id?.description ?? ""
////        } else {
////            self.subCategoryList = self.discussionForumSubCategoryList?[row].title ?? ""
////            subCategoryTF.text = self.subCategoryList
////            self.subCategoryListId = self.discussionForumSubCategoryList?[row].id?.description ?? ""
////        }
////
////    }
//}
