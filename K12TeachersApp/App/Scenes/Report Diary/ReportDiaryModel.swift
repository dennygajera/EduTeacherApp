//
//  ReportDiaryModel.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 24/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
struct ReportDiaryChaptersModel : Codable {
    let id : Int?
    let chapter_name : String?
    let is_delete : Bool?
    let is_academic : Bool?
    let is_hidden : Bool?
    let grade : Int?
    let subject : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case chapter_name = "chapter_name"
        case is_delete = "is_delete"
        case is_academic = "is_academic"
        case is_hidden = "is_hidden"
        case grade = "grade"
        case subject = "subject"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        chapter_name = try values.decodeIfPresent(String.self, forKey: .chapter_name)
        is_delete = try values.decodeIfPresent(Bool.self, forKey: .is_delete)
        is_academic = try values.decodeIfPresent(Bool.self, forKey: .is_academic)
        is_hidden = try values.decodeIfPresent(Bool.self, forKey: .is_hidden)
        grade = try values.decodeIfPresent(Int.self, forKey: .grade)
        subject = try values.decodeIfPresent(Int.self, forKey: .subject)
    }

}

struct MediaData {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    let getType : String
    let getPreviewUrl : String
    
    init?(withMedia data: NSData, forKey key: String , mimetype : String , fileExtantion : String,Type : String,url : String) {
        self.key = key
        
        var mime : String!

        var fileE : String!

        
        if mimetype == "" && Type == "image"{
            
            mime = "image/jpeg"
            
        }else if mimetype == "" && Type == "video"{
            
            mime = "video/mp4"
            
        }else if mimetype == "" && Type == "file"{
            
            mime = "application/pdf"
            
        }else{
                
            mime = mimetype
        
        }

        if fileExtantion == "" && Type == "image"{
            
            fileE = "jpeg"
            
        }else if fileExtantion == "" && Type == "video"{
            
            fileE = "mp4"
            
        }else if fileExtantion == "" && Type == "file"{
            
            fileE = "pdf"
            
        }else{
                
            fileE = fileExtantion
            
        }

        
        
        let getName = MediaAttachment.shared.randomString(length : 12)
        
        self.mimeType = mime
        self.filename = "\(getName).\(fileE!)"
        self.data = data as Data
        
        self.getType = Type
        
        self.getPreviewUrl = url
        
    }
    
}
