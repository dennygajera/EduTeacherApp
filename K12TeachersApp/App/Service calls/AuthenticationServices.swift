//
//  Services.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation

extension ApiHelper {
    
    var authHeader: [String: String] {
        get {
            return [
                "Content-Type":"application/json",
                "Authorization": "Bearer \(SessionManager.accessToken)"
            ]
        }
    }
    
    func loginRequest(payload: JSON, success: @escaping(Data) -> (), failure: @escaping(serviceError) -> ()) {
        header["Content-Type"] = "application/json"
        PostRequest(endpoint: APIEndPoints.login, headers: header, payloads: payload, failure: { (err) in
            failure(err)
        }) { (data) in
            success(data)
        }
    }
}
