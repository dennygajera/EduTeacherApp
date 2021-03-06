//
//  ViewblogsServices.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation


extension ApiHelper {
    
    func viewBlogsRequest(setUrl: APIEndPoints, success: @escaping(Data) -> (), failure: @escaping(serviceError) -> ()) {
        GetRequest(endpoint: setUrl, headers: ApiHelper.shared.authHeader, failure: { (err) in
            failure(err)
        }) { (data) in
            success(data)
        }
    }
    
}
