//
//  ViewBlogsViewModel.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class ViewBlogsViewModel: NSObject {

    var viewBlogsModelInfo: ViewBlogsModel?
    var viewBlogsArray: [ViewBlogsData]?
    var searchBlogsArray: [ViewBlogsData]?
    
    func getViewBlogs(pageNo:String, pageSize:String, reviewed:String, completion: (() -> Void)?) {
        let url = APIEndPoints.viewBlogs(pagenumber: pageNo, pageSize: pageSize, isReviewed: reviewed)
        printMe(object: url)
        ApiHelper.shared.viewBlogsRequest(setUrl: url, success: {[weak self] (successJson) in
            guard let self = self else {return}
            printMe(object: successJson)
            let viewBlogsInfo = try! JSONDecoder().decode(ViewBlogsModel.self, from: successJson)
            
            if self.viewBlogsModelInfo != nil {
                self.viewBlogsArray = self.viewBlogsArray! + viewBlogsInfo.data!
            }else {
                self.viewBlogsModelInfo = viewBlogsInfo
                self.viewBlogsArray = viewBlogsInfo.data
            }
            completion?()
        }) { (err) in
            printMe(object: err)
        }
    }
    
}
