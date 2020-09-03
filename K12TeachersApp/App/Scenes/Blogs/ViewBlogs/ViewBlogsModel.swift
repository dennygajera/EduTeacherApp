//
//  ViewBlogsModel.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation

struct ViewBlogsModel : Codable {
    let data : [ViewBlogsData]?
    let current_page : String?
    let total_pages : Int?
    let total_blogs : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
        case current_page = "current_page"
        case total_pages = "total_pages"
        case total_blogs = "total_blogs"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([ViewBlogsData].self, forKey: .data)
        current_page = try values.decodeIfPresent(String.self, forKey: .current_page)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
        total_blogs = try values.decodeIfPresent(Int.self, forKey: .total_blogs)
    }
    
}

//
struct ViewBlogsData : Codable {
    let id : Int?
    let title : String?
    let created_at : String?
    let is_reviewed : Bool?
    let is_published : Bool?
    let thumbnail : String?
    let blog_fk : [ViewBlogs_Blog_fk]?
    let content : String?
    let author : ViewBlogsAuthor?
    let genre : ViewBlogsGenre?
    let likes : Int?
    let blog_fk_like : [ViewBlogs_Blog_fk_like]?
    let blog_fk_revision : [ViewBlogs_blog_fk_revision]?
    let is_revision_required : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case created_at = "created_at"
        case is_reviewed = "is_reviewed"
        case is_published = "is_published"
        case thumbnail = "thumbnail"
        case blog_fk = "blog_fk"
        case content = "content"
        case author = "author"
        case genre = "genre"
        case likes = "likes"
        case blog_fk_like = "blog_fk_like"
        case blog_fk_revision = "blog_fk_revision"
        case is_revision_required = "is_revision_required"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        is_reviewed = try values.decodeIfPresent(Bool.self, forKey: .is_reviewed)
        is_published = try values.decodeIfPresent(Bool.self, forKey: .is_published)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        blog_fk = try values.decodeIfPresent([ViewBlogs_Blog_fk].self, forKey: .blog_fk)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        author = try values.decodeIfPresent(ViewBlogsAuthor.self, forKey: .author)
        genre = try values.decodeIfPresent(ViewBlogsGenre.self, forKey: .genre)
        likes = try values.decodeIfPresent(Int.self, forKey: .likes)
        blog_fk_like = try values.decodeIfPresent([ViewBlogs_Blog_fk_like].self, forKey: .blog_fk_like)
        blog_fk_revision = try values.decodeIfPresent([ViewBlogs_blog_fk_revision].self, forKey: .blog_fk_revision)
        is_revision_required = try values.decodeIfPresent(Bool.self, forKey: .is_revision_required)
    }
    
}

//
struct ViewBlogs_Blog_fk : Codable {
    let average_rating : Double?
    let remark_rating : [ViewBlogs_Remark_rating]?
    let reviewed_by : Int?
    let overall_remark : String?
    let blog_review_updated_at : String?
    let blog_review_updated_by : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case average_rating = "average_rating"
        case remark_rating = "remark_rating"
        case reviewed_by = "reviewed_by"
        case overall_remark = "overall_remark"
        case blog_review_updated_at = "blog_review_updated_at"
        case blog_review_updated_by = "blog_review_updated_by"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        average_rating = try values.decodeIfPresent(Double.self, forKey: .average_rating)
        remark_rating = try values.decodeIfPresent([ViewBlogs_Remark_rating].self, forKey: .remark_rating)
        reviewed_by = try values.decodeIfPresent(Int.self, forKey: .reviewed_by)
        overall_remark = try values.decodeIfPresent(String.self, forKey: .overall_remark)
        blog_review_updated_at = try values.decodeIfPresent(String.self, forKey: .blog_review_updated_at)
        blog_review_updated_by = try values.decodeIfPresent(Double.self, forKey: .blog_review_updated_by)
    }
    
}

//
struct ViewBlogs_Remark_rating : Codable {
    let rating : Double?
    let remark : String?
    let rating_type : String?
    
    enum CodingKeys: String, CodingKey {
        
        case rating = "rating"
        case remark = "remark"
        case rating_type = "rating_type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        remark = try values.decodeIfPresent(String.self, forKey: .remark)
        rating_type = try values.decodeIfPresent(String.self, forKey: .rating_type)
    }
    
}

//
struct ViewBlogsAuthor : Codable {
    let id : Int?
    let username : String?
    let student : ViewBlogsStudent?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case username = "username"
        case student = "student"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        student = try values.decodeIfPresent(ViewBlogsStudent.self, forKey: .student)
    }
    
}
//
struct ViewBlogsStudent : Codable {
    let id : Int?
    let name : String?
    let erp : String?
    let branch : ViewBlogsBranch?
    let grade : ViewBlogsGrade?
    let section : ViewBlogsSection?
    let father_mobile : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case erp = "erp"
        case branch = "branch"
        case grade = "grade"
        case section = "section"
        case father_mobile = "father_mobile"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        erp = try values.decodeIfPresent(String.self, forKey: .erp)
        branch = try values.decodeIfPresent(ViewBlogsBranch.self, forKey: .branch)
        grade = try values.decodeIfPresent(ViewBlogsGrade.self, forKey: .grade)
        section = try values.decodeIfPresent(ViewBlogsSection.self, forKey: .section)
        father_mobile = try values.decodeIfPresent(String.self, forKey: .father_mobile)
    }
    
}

//
struct ViewBlogsGrade : Codable {
    let grade : String?
    
    enum CodingKeys: String, CodingKey {
        
        case grade = "grade"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        grade = try values.decodeIfPresent(String.self, forKey: .grade)
    }
    
}

//
struct ViewBlogsBranch : Codable {
    let branch_name : String?
    
    enum CodingKeys: String, CodingKey {
        
        case branch_name = "branch_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        branch_name = try values.decodeIfPresent(String.self, forKey: .branch_name)
    }
    
}

//
struct ViewBlogsSection : Codable {
    let section_name : String?
    
    enum CodingKeys: String, CodingKey {
        
        case section_name = "section_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        section_name = try values.decodeIfPresent(String.self, forKey: .section_name)
    }
    
}

//
struct ViewBlogsGenre : Codable {
    let id : Int?
    let genre : String?
    let genre_subtype : String?
    let is_deleted : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case genre = "genre"
        case genre_subtype = "genre_subtype"
        case is_deleted = "is_deleted"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        genre = try values.decodeIfPresent(String.self, forKey: .genre)
        genre_subtype = try values.decodeIfPresent(String.self, forKey: .genre_subtype)
        is_deleted = try values.decodeIfPresent(Bool.self, forKey: .is_deleted)
    }
    
}

//
struct ViewBlogs_Blog_fk_like : Codable {
    let id : Int?
    let is_liked : Bool?
    let user : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case is_liked = "is_liked"
        case user = "user"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        is_liked = try values.decodeIfPresent(Bool.self, forKey: .is_liked)
        user = try values.decodeIfPresent(Int.self, forKey: .user)
    }
    
}

struct ViewBlogs_blog_fk_revision: Codable {
     let id : Int?
    let feedback : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case feedback = "feedback"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        feedback = try values.decodeIfPresent(String.self, forKey: .feedback)
    }

}
