//
//  ReportDiaryServices.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 25/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
extension ApiHelper {
    func getDiaryChapters(setUrl: APIEndPoints, success: @escaping(Data) -> (), failure: @escaping(serviceError) -> ()){
        GetRequest(endpoint: setUrl, headers: ApiHelper.shared.authHeader, failure: { (err) in
            failure(err)
        }) { (data) in
            success(data)
        }
    }
    func postDiaryReport(setUrl: APIEndPoints,payload: JSON, success: @escaping(Data) -> (), failure: @escaping(serviceError) -> ()){
        PostRequest(endpoint: setUrl, headers: ApiHelper.shared.authHeader, payloads: payload, failure: { (err) in
            printMe(object: err)
            failure(err)
        }) { (data) in
            success(data)
        }
    }
}
