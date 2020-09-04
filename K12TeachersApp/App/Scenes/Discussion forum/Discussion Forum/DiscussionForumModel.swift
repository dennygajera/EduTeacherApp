//
//  DiscussionForumModel.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services on 28/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
class DiscussionPostListModel: NSObject {
    
    var discussionForumPostListData : DiscussionForumPostListModel? = nil

    func getfetchMyActivityDiscusstionPostsList(pageNo:String, pageSize:String, categoryId: String = "",type: String,completion: (() -> Void)?) {
        let url = APIEndPoints.discussionforumPosts(pagenumber: pageNo, pageSize: pageSize, category: categoryId, type: type)
           printMe(object: url)
           ApiHelper.shared.fetchMyActivityDiscusstionPostsList(setUrl: url, success: {[weak self] (successJson) in
               guard let self = self else {return}
               printMe(object: successJson)
               let discussionInfo = try! JSONDecoder().decode(DiscussionForumPostListModel.self, from: successJson)
               self.discussionForumPostListData = discussionInfo
               completion?()
           }) { (err) in
               printMe(object: err)
           }
       }
}
struct DiscussionForumPostListModel : Codable {
//    let next : String?
//    let previous : String?
    let count : Int?
    let limit : Int?
    let current_page : Int?
    let total_pages : Int?
    var results : [DiscussionForumPostListModelResults]?

    enum CodingKeys: String, CodingKey {
//
//        case next = "next"
//        case previous = "previous"
        case count = "count"
        case limit = "limit"
        case current_page = "current_page"
        case total_pages = "total_pages"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        next = try values.decodeIfPresent(String.self, forKey: .next)
//        previous = try values.decodeIfPresent(String.self, forKey: .previous)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
        results = try values.decodeIfPresent([DiscussionForumPostListModelResults].self, forKey: .results)
    }

}
struct DiscussionForumPostListModelResults : Codable {
    let id : Int?
    let title : String?
    let description : String?
    let post_user : DiscussionForumPostListModelPost_user?
    let post_creation_ago : String?
    let comment_count : String?
//    let file : String?
    let like_count : String?
    let user_like : Bool?
    let category : DiscussionForumPostListModelCategory?
    let sub_category : DiscussionForumPostListModelSub_category?
    let sub_sub_category : DiscussionForumPostListModelSub_sub_category?
    let gold_count : Int?
    let silver_count : Int?
    let bronze_count : Int?
    let post_related_data : DiscussionForumPostListModelPost_related_data?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case description = "description"
        case post_user = "post_user"
        case post_creation_ago = "post_creation_ago"
        case comment_count = "comment_count"
//        case file = "file"
        case like_count = "like_count"
        case user_like = "user_like"
        case category = "category"
        case sub_category = "sub_category"
        case sub_sub_category = "sub_sub_category"
        case gold_count = "gold_count"
        case silver_count = "silver_count"
        case bronze_count = "bronze_count"
        case post_related_data = "post_related_data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        post_user = try values.decodeIfPresent(DiscussionForumPostListModelPost_user.self, forKey: .post_user)
        post_creation_ago = try values.decodeIfPresent(String.self, forKey: .post_creation_ago)
        comment_count = try values.decodeIfPresent(String.self, forKey: .comment_count)
//        file = try values.decodeIfPresent(String.self, forKey: .file)
        like_count = try values.decodeIfPresent(String.self, forKey: .like_count)
        user_like = try values.decodeIfPresent(Bool.self, forKey: .user_like)
        category = try values.decodeIfPresent(DiscussionForumPostListModelCategory.self, forKey: .category)
        sub_category = try values.decodeIfPresent(DiscussionForumPostListModelSub_category.self, forKey: .sub_category)
        sub_sub_category = try values.decodeIfPresent(DiscussionForumPostListModelSub_sub_category.self, forKey: .sub_sub_category)
        gold_count = try values.decodeIfPresent(Int.self, forKey: .gold_count)
        silver_count = try values.decodeIfPresent(Int.self, forKey: .silver_count)
        bronze_count = try values.decodeIfPresent(Int.self, forKey: .bronze_count)
        post_related_data = try values.decodeIfPresent(DiscussionForumPostListModelPost_related_data.self, forKey: .post_related_data)
    }

}
struct DiscussionForumPostListModelPost_user : Codable {
    let username : String?
    let first_name : String?
    let last_name : String?

    enum CodingKeys: String, CodingKey {

        case username = "username"
        case first_name = "first_name"
        case last_name = "last_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
    }

}
struct DiscussionForumPostListModelCategory : Codable {
    let id : Int?
    let title : String?
    let is_delete : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case is_delete = "is_delete"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        is_delete = try values.decodeIfPresent(Bool.self, forKey: .is_delete)
    }

}
struct DiscussionForumPostListModelSub_category : Codable {
    let id : Int?
    let title : String?
    let is_delete : Bool?
    let category_fk : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case is_delete = "is_delete"
        case category_fk = "category_fk"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        is_delete = try values.decodeIfPresent(Bool.self, forKey: .is_delete)
        category_fk = try values.decodeIfPresent(Int.self, forKey: .category_fk)
    }

}
struct DiscussionForumPostListModelSub_sub_category : Codable {
    let id : Int?
    let title : String?
    let is_delete : Bool?
    let sub_category_fk : Int?
    let category_fk : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case is_delete = "is_delete"
        case sub_category_fk = "sub_category_fk"
        case category_fk = "category_fk"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        is_delete = try values.decodeIfPresent(Bool.self, forKey: .is_delete)
        sub_category_fk = try values.decodeIfPresent(Int.self, forKey: .sub_category_fk)
        category_fk = try values.decodeIfPresent(Int.self, forKey: .category_fk)
    }

}
struct DiscussionForumPostListModelPost_related_data : Codable {
    let branch : String?
    let grade : String?
    let section : String?

    enum CodingKeys: String, CodingKey {

        case branch = "branch"
        case grade = "grade"
        case section = "section"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        branch = try values.decodeIfPresent(String.self, forKey: .branch)
        grade = try values.decodeIfPresent(String.self, forKey: .grade)
        section = try values.decodeIfPresent(String.self, forKey: .section)
    }

}

