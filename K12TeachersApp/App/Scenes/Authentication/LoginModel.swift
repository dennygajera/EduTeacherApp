//
//  LoginModel.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
struct LoginModel : Codable {
    let academic_profile : [Academic_profile]?
    let personal_info : Personal_info?
    let branch_id : Int?
    let branch_name : String?
    let erp : String?

    enum CodingKeys: String, CodingKey {

        case academic_profile = "academic_profile"
        case personal_info = "personal_info"
        case branch_id = "branch_id"
        case branch_name = "branch_name"
        case erp = "erp"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        academic_profile = try values.decodeIfPresent([Academic_profile].self, forKey: .academic_profile)
        personal_info = try values.decodeIfPresent(Personal_info.self, forKey: .personal_info)
        branch_id = try values.decodeIfPresent(Int.self, forKey: .branch_id)
        branch_name = try values.decodeIfPresent(String.self, forKey: .branch_name)
        erp = try values.decodeIfPresent(String.self, forKey: .erp)
    }

}

struct Academic_profile : Codable {
    let subject_id : Int?
    let subject_name : String?
    let section_id : Int?
    let section_name : String?
    let grade_id : Int?
    let grade_name : String?
    let branch_id : Int?
    let branch_name : String?
    let section_mapping_id : Int?
    let subject_mapping_id : Int?
    let acad_branch_grade_mapping_id : Int?
    let acad_session_id : Int?
    let acad_session : String?

    enum CodingKeys: String, CodingKey {

        case subject_id = "subject_id"
        case subject_name = "subject_name"
        case section_id = "section_id"
        case section_name = "section_name"
        case grade_id = "grade_id"
        case grade_name = "grade_name"
        case branch_id = "branch_id"
        case branch_name = "branch_name"
        case section_mapping_id = "section_mapping_id"
        case subject_mapping_id = "subject_mapping_id"
        case acad_branch_grade_mapping_id = "acad_branch_grade_mapping.id"
        case acad_session_id = "acad_session_id"
        case acad_session = "acad_session"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subject_id = try values.decodeIfPresent(Int.self, forKey: .subject_id)
        subject_name = try values.decodeIfPresent(String.self, forKey: .subject_name)
        section_id = try values.decodeIfPresent(Int.self, forKey: .section_id)
        section_name = try values.decodeIfPresent(String.self, forKey: .section_name)
        grade_id = try values.decodeIfPresent(Int.self, forKey: .grade_id)
        grade_name = try values.decodeIfPresent(String.self, forKey: .grade_name)
        branch_id = try values.decodeIfPresent(Int.self, forKey: .branch_id)
        branch_name = try values.decodeIfPresent(String.self, forKey: .branch_name)
        section_mapping_id = try values.decodeIfPresent(Int.self, forKey: .section_mapping_id)
        subject_mapping_id = try values.decodeIfPresent(Int.self, forKey: .subject_mapping_id)
        acad_branch_grade_mapping_id = try values.decodeIfPresent(Int.self, forKey: .acad_branch_grade_mapping_id)
        acad_session_id = try values.decodeIfPresent(Int.self, forKey: .acad_session_id)
        acad_session = try values.decodeIfPresent(String.self, forKey: .acad_session)
    }

}

struct Personal_info : Codable {
    let user_id : Int?
    let email : String?
    let first_name : String?
    let second_name : String?
    let token : String?
    let role : String?
    let role_id : Int?
    let force_update_credentials : Bool?

    enum CodingKeys: String, CodingKey {

        case user_id = "user_id"
        case email = "email"
        case first_name = "first_name"
        case second_name = "second_name"
        case token = "token"
        case role = "role"
        case role_id = "role_id"
        case force_update_credentials = "force_update_credentials"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        second_name = try values.decodeIfPresent(String.self, forKey: .second_name)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        role_id = try values.decodeIfPresent(Int.self, forKey: .role_id)
        force_update_credentials = try values.decodeIfPresent(Bool.self, forKey: .force_update_credentials)
    }

}
