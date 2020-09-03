//
//  ViewBlogsVC.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class ViewBlogsVC: UIViewController {
    
//    MARK:- creating Outlets from storyboards
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var buttonPendingReview: UIButton!
    @IBOutlet weak var buttonReviewed: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var viewBlogsTableView: UITableView!
    @IBOutlet weak var emptyStateView: UIView!
    
//    MARK:- variable used througout the app
    var viewBlogsVM = ViewBlogsViewModel()
    var currentPageNo: Int = 1
    var isReviewed: String = "False"
    var loadMoreItems: Bool = false
    var isSearching: Bool = false
    
//    MARK:- function called for calling api in VC
    fileprivate func getViewBlogs(currentPage: Int, isReviewed: String) {
        //
        loadMoreItems == false ? ProgressHud.showActivityIndicator(uiView: self.view): nil
        loadMoreItems = false
        viewBlogsVM.getViewBlogs(pageNo: "\(currentPageNo)", pageSize: "\(blogsPageSize)", reviewed: isReviewed) {
            DispatchQueue.main.async {
                self.viewBlogsVM.searchBlogsArray = self.viewBlogsVM.viewBlogsArray
                self.viewBlogsTableView.reloadData()
                self.showEmptyView()
                ProgressHud.hideActivityIndicator(uiView: self.view)
                
            }
        }
    }
//  MARK:- to show emptystate if no data available
    fileprivate func showEmptyView() {
        let showEmptyView = self.viewBlogsVM.searchBlogsArray?.count == 0 ? true : false
        self.viewBlogsTableView.isHidden = showEmptyView
        self.emptyStateView.isHidden = !showEmptyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "View Blogs"
        view.backgroundColor = .appBackgroundColor
        holderView.applyTopCornerRadius()
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(ViewBlogsVC.textFieldDidChange(_:)), for: .editingChanged)
        searchTextField.clearButtonMode = .whileEditing
        searchTextField.placeholder = "Search for titles"
        
        hideKeyboardWhenTappedAround()
        setSegmentedUI(buttonPendingReview, buttonReviewed)
        //
        updateTableView()
        emptyStateView.isHidden = true
        getViewBlogs(currentPage: currentPageNo, isReviewed: "False")
    }
    
    fileprivate func updateTableView() {
        viewBlogsTableView.register(ViewBlogsTVCell.cellNib, forCellReuseIdentifier: ViewBlogsTVCell.cellId)
        viewBlogsTableView.delegate = self
        viewBlogsTableView.dataSource = self
        viewBlogsTableView.separatorStyle = .none
        viewBlogsTableView.showsVerticalScrollIndicator = false
        viewBlogsTableView.tableFooterView = UIView()
    }
    
    
    //MARK:- VC Actions
    
    @IBAction func pendingReviewTapped(_ sender: Any) {
        currentPageNo = 1
        isReviewed = "False"
        viewBlogsVM.viewBlogsModelInfo = nil
        getViewBlogs(currentPage: currentPageNo, isReviewed: isReviewed)
        
        setSegmentedUI(buttonPendingReview, buttonReviewed)
    }
    
    @IBAction func reviewedTapped(_ sender: Any) {
        currentPageNo = 1
        isReviewed = "True"
        viewBlogsVM.viewBlogsModelInfo = nil
        getViewBlogs(currentPage: currentPageNo, isReviewed: isReviewed)
        setSegmentedUI(buttonReviewed, buttonPendingReview)
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        searchTextField.becomeFirstResponder()
    }
    
    @IBAction func filterTapped(_ sender: Any) {
    }
}

//MARK:- UITextFieldDelegate
extension ViewBlogsVC: UITextFieldDelegate {
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let searchText = searchTextField.text!
        isSearching = true
        viewBlogsVM.searchBlogsArray = searchText.isEmpty ? self.viewBlogsVM.viewBlogsArray : self.viewBlogsVM.viewBlogsArray?.filter{($0.title?.capitalized.contains(searchText.capitalized))!}
        self.showEmptyView()
        viewBlogsTableView.reloadData()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        isSearching = textField.text?.count != 0 ? true : false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

//MARK:- UITableView Delegates and DataSources
extension ViewBlogsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewBlogsVM.searchBlogsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewBlogsTVCell.cellId, for: indexPath) as! ViewBlogsTVCell
        cell.blogItem = viewBlogsVM.searchBlogsArray?[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height * 4 {
            if currentPageNo < (viewBlogsVM.viewBlogsModelInfo?.total_pages ?? 0) && isSearching == false {
                loadMoreItems = true
                currentPageNo = currentPageNo + 1
                getViewBlogs(currentPage: currentPageNo, isReviewed: isReviewed)
            }
        }
    }
}
