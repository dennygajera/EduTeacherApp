//
//  ReportDiartViewModel.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 24/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class ReportDiartViewModel: NSObject {

    var getChaptersInfo: [ReportDiaryChaptersModel]?
    var successMessage = String()
    func getChapters(subject_id:String, grade_id:String, is_academic:String, completion: (() -> Void)?){
        let url = APIEndPoints.reportDiaryChapters(subject_id: subject_id, grade_id: grade_id, is_academic: is_academic)
        ApiHelper.shared.getDiaryChapters(setUrl: url, success: {[weak self] (successJson) in
            guard let self = self else {return}
            printMe(object: successJson)
            let diaryReportInfo = try! JSONDecoder().decode([ReportDiaryChaptersModel].self, from: successJson)
            self.getChaptersInfo = diaryReportInfo
            completion?()
        }) { (err) in
            printMe(object: err)
        }
    }
    func postReportDiary(payload: JSON, completion: (() -> Void)?){
        //section_mapping_id:Int, subject_mapping_ids:Int, recap:String, summary:String, classwork:String, homework:String, support_materials:String, chapter_id:Int, file0: [MediaData]
        printMe(object: payload)
        ApiHelper.shared.postDiaryReport(setUrl: APIEndPoints.postReportDiary, payload: payload, success: { (successJson) in
            printMe(object: "successJson = \(successJson)")
            completion?()
        }) { (err) in
            printMe(object: err)
        }
        
    }
    
}
