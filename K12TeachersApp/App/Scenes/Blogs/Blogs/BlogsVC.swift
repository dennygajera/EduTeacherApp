//
//  BlogsVC.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class BlogsVC: BaseVC {
    
    @IBOutlet weak var blogsTableView: UITableView!
    
    var blogsVM = BlogsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Blogs"
        updateTableView()
    }
    
    fileprivate func updateTableView() {
        blogsTableView.register(TopicTitleTVCell.cellNib, forCellReuseIdentifier: TopicTitleTVCell.cellId)
        blogsTableView.delegate = self
        blogsTableView.dataSource = self
        blogsTableView.separatorStyle = .none
        blogsTableView.applyTopCornerRadius()
        blogsTableView.backgroundColor = .clear
        blogsTableView.tableFooterView = UIView()
    }
}

//MARK:- UITableView Delegates and DataSources
extension BlogsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogsVM.blogsTopicArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopicTitleTVCell.cellId, for: indexPath) as! TopicTitleTVCell
        cell.topicTitle = blogsVM.blogsTopicArray[indexPath.row].blogType
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VCTpye = blogsVM.blogsTopicArray[indexPath.row].blogVC ?? ""
        DispatchQueue.main.async {
            let VC = blogsSB.instantiateViewController(withIdentifier: VCTpye)
            self.navigationController?.pushViewController(VC, animated: true)
            
        }
    }
    
    
}
