//
//  DiscussionForumVC.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services on 20/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class DiscussionForumVC: BaseVC {
    
    @IBOutlet weak var holder_View: UIView!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var btnActivityLog: UIButton!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var discussionForumTableView: UITableView!
    
    @IBOutlet weak var ViewPagnation: UIView!
    @IBOutlet weak var pagnationViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var label_pageNumber: UILabel!
    @IBOutlet weak var labelTotalPages: UILabel!
    @IBOutlet weak var btn_goToFirst: UIButton!
    @IBOutlet weak var btn_StepBackOne: UIButton!
    @IBOutlet weak var btn_ForwardOne: UIButton!
    @IBOutlet weak var btn_goToLast: UIButton!
    
    //    var studentInfo : StudentInfo? = nil
    //    var discussionForumCategoryList : [DiscussionForumCategoryModel]? = nil
    //    var discussionForumPostList : DiscussionForumPostListModel? = nil
    //
    //    var sendPostDetails : DiscussionForumPostListModelResults? = nil
    //
    //    var likeResponseModel : DiscussionForumLikeModel? = nil
    
    var categoryList = String()
    var categoryListId = String()
    var postId = String()
    var goldCount = Int()
    var silverCount = Int()
    var bronzeCount = Int()
    var categoryPicker = UIPickerView()
    var categoryToolBar = UIToolbar()
    var logsType = "Active Log"
    var discussionpostmodalVM = DiscussionPostListModel()
    var loadMoreItems: Bool = false
    var discussionForumPostList : DiscussionForumPostListModel? = nil
    var refreshControl = UIRefreshControl()
    var discussionForumPostListresults : [DiscussionForumPostListModelResults]?
    var viewModel = DiscussionForumView_Model()
    var strSelectedCategory: String = ""
    var lastSelectedCategoryId = ""
    override func viewDidAppear(_ animated: Bool) {
        BasicMethods()
        pickerFun()
        ProgressHud.showActivityIndicator(uiView: self.view)
        viewModel.postCategoryList(payload: [:]) {
            
        }
        ProgressHud.hideActivityIndicator(uiView: self.view)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Discussion Forum"
        holder_View.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        holder_View.layer.cornerRadius = 24.0
        holder_View.clipsToBounds = true
        self.getfetchMyActivityDiscusstionPostsList(pageNo: "1", pageSize: "10")
        self.refreshControl.attributedTitle = NSAttributedString(string: "Fetching more quieries!")
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        discussionForumTableView.addSubview(refreshControl)
        
        //        fetchActivityLogsPostApi(category_id: "")
        // Do any additional setup after loading the view.
    }
    fileprivate func getfetchMyActivityDiscusstionPostsList(pageNo: String, pageSize: String, categoryId: String = "") {
        //
        loadMoreItems == false ? ProgressHud.showActivityIndicator(uiView: self.view): nil
        loadMoreItems = false
        discussionpostmodalVM.getfetchMyActivityDiscusstionPostsList(pageNo: pageNo, pageSize: pageSize, categoryId: categoryId) {
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.discussionForumPostList = self.discussionpostmodalVM.discussionForumPostListData
                if(self.discussionForumPostList?.results?.count ?? 0 > 0){
                    print(self.lastSelectedCategoryId)
                    if self.lastSelectedCategoryId == categoryId {
                        if(self.discussionForumPostListresults?.count ?? 0 > 0){
                            self.discussionForumPostListresults?.append(contentsOf: (self.discussionForumPostList?.results)!)
                        } else {
                            self.discussionForumPostListresults = self.discussionForumPostList?.results
                        }
                    } else {
                        self.discussionForumPostListresults = self.discussionForumPostList?.results
                    }
                }
                self.lastSelectedCategoryId = categoryId
                self.discussionForumTableView.reloadData()
                ProgressHud.hideActivityIndicator(uiView: self.view)
                
            }
        }
    }
    
    @objc func refresh() {
        let  page = self.discussionForumPostList?.current_page ?? 1
        let pageaddition = page + 1
        let totalitems:Int? = self.discussionForumPostList?.count ?? 10
        let result: Double = Double(totalitems! / 10)
        //denny
        if (Int(result) > page) {
            getfetchMyActivityDiscusstionPostsList(pageNo: "\(String(pageaddition))", pageSize: "10", categoryId: strSelectedCategory)
        }
    }
    
    //MARK: Picker Functions
    func pickerFun(){
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        let categoryDoneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(categoryDone))
        let categorySpcBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let categoryCancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(categoryCancel))
        categoryToolBar.setItems([categoryCancelBtn, categorySpcBtn ,categoryDoneBtn], animated: true)
        categoryToolBar.isUserInteractionEnabled = true
        categoryToolBar.isTranslucent = true
        categoryToolBar.sizeToFit()
        categoryTF.inputView = categoryPicker
        categoryTF.inputAccessoryView = categoryToolBar
        categoryToolBar.barStyle = .default
        categoryToolBar.isTranslucent = true
        categoryToolBar.sizeToFit()
        categoryToolBar.tintColor = .black
        categoryToolBar.backgroundColor = .darkGray
    }
    
    @objc func categoryDone(){
        categoryTF.resignFirstResponder()
        self.getfetchMyActivityDiscusstionPostsList(pageNo: "1", pageSize: "10", categoryId: strSelectedCategory != "" ? strSelectedCategory: "1")
    }
    
    @objc func categoryCancel(){
        categoryTF.resignFirstResponder()
    }
    
    fileprivate func BasicMethods() {
        if #available(iOS 13, *) {
            self.overrideUserInterfaceStyle = .light
        }
        
        if let savedPerson = UserDefaults.standard.object(forKey: "studentInfoSaved") as? Data {
            let decoder = JSONDecoder()
            //               if let loadedPerson = try? decoder.decode(StudentInfo.self, from: savedPerson) {
            //                   self.studentInfo = loadedPerson
            // set profile image to navigation bar
            //                   noti_imageView.imageFromURL(urlString: self.studentInfo?.student_photo ?? "placeholder")
        }
        
    }
  
    
    @IBAction func btnNewFeeds(_ sender: Any) {
        self.performSegue(withIdentifier: "toCreatePost", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toComments"){
            let vc = segue.destination as! DiscussionForumViewCommentsVC
            vc.getPostID = self.postId
        } else if(segue.identifier == "toMedals"){
            let vc = segue.destination as! DiscussionForumMedalsVC
            vc.getPostId = self.postId
            vc.getGoldCount = self.goldCount.description
            vc.getSilverCount = self.silverCount.description
            vc.getBronzeCount = self.bronzeCount.description
        } else if(segue.identifier == "toPost"){
            let vc = segue.destination as! DiscussionForumViewPostVC
            //            vc.getPostDetails = self.sendPostDetails
        }
    }
}
extension DiscussionForumVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.viewModel.arrCategoryList?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.viewModel.arrCategoryList![row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        strSelectedCategory = "\(self.viewModel.arrCategoryList![row].id ?? 0)"
        categoryTF.text = self.viewModel.arrCategoryList![row].title
    }
}
