//
//  DiscussionForumViewModel.swift
//  K12TeachersApp
//
//  Created by Darshan on 03/09/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

struct Category: Codable {
    var id: Int?
    var title: String?
}

class DiscussionForumView_Model: NSObject {
    var arrCategoryList: [Category]?
    func postCategoryList(payload: JSON, completion: (() -> Void)?){
        //section_mapping_id:Int, subject_mapping_ids:Int, recap:String, summary:String, classwork:String, homework:String, support_materials:String, chapter_id:Int, file0: [MediaData]
        printMe(object: payload)
        ApiHelper.shared.getDiaryChapters(setUrl: APIEndPoints.categoryList, success: {[weak self] (successJson) in
            guard let self = self else {return}
            printMe(object: successJson)
            let diaryReportInfo = try! JSONDecoder().decode([Category].self, from: successJson)
            self.arrCategoryList = diaryReportInfo
            completion?()
        }) { (err) in
            printMe(object: err)
        }
    }
    
}

extension ApiHelper {
    func getCategoryList(setUrl: APIEndPoints,payload: JSON, success: @escaping(Data) -> (), failure: @escaping(serviceError) -> ()){
        PostRequest(endpoint: setUrl, headers: ApiHelper.shared.authHeader, payloads: payload, failure: { (err) in
            printMe(object: err)
            failure(err)
        }) { (data) in
            success(data)
        }
    }
}
