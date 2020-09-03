//
//  APIConstants.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation

typealias JSON = [String: AnyObject]

enum APIEndPoints {
    case login
    case viewBlogs(pagenumber: String, pageSize: String, isReviewed: String)
    case reportDiaryChapters(subject_id: String, grade_id: String, is_academic: String)
    case postReportDiary
    case categoryList
    case discussionforumPosts(pagenumber: String, pageSize: String, category: String = "")
}
//https://erp.letseduvate.com/qbox/activity_app/login/
//https://erp.letseduvate.com/qbox/academic/blog/create_blog/?page_number=1&page_size=12&is_published=False&is_reviewed=True
//https://erp.letseduvate.com/qbox/academic/questbox/chapter/?subject_id=1&grade_id=6&is_academic=True
extension APIEndPoints: EndpointType {
    var baseURL: URL {
        return URL(string: "https://erp.letseduvate.com/qbox/")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "activity_app/login/"
        case .viewBlogs(let pgNo, let pgSize, let reViewed):
            return "academic/blog/create_blog/?page_number=\(pgNo)&page_size=\(pgSize)&is_published=False&is_reviewed=\(reViewed)"
        case .reportDiaryChapters(let subject_id, let grade_id, let is_academic):
            return "academic/questbox/chapter/?subject_id=\(subject_id)&grade_id=\(grade_id)&is_academic=\(is_academic)"
        case .postReportDiary:
            return "academic/v2/report/"
            
        case .discussionforumPosts(let pgNo, let pgSize, let categoeyId):
            if categoeyId != "" {
            return "discussion/list_posts_mobile/?grade=&branch=&category=\(categoeyId)&page=\(pgNo)&page_size=\(pgSize)"
            } else {
                return "discussion/list_posts_mobile/?grade=&branch=&page=\(pgNo)&page_size=\(pgSize)"
            }
            
        case .categoryList:
            return "discussion/list_category/"
            
        }
    }
}
