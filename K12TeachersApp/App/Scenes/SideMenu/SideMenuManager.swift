//
//  SideMenuManager.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class SideMenuManager: NSObject {
    
    static let sharedInstance = SideMenuManager()
    
    func getSideMenuResponse(onSuccess: @escaping([Any]?) -> ())
    {
        do {
            if let file = Bundle.main.url(forResource: "SideMenu", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                        let projectResult = object["teacherSideMenuList"] as! NSArray
                        print(object)
                        onSuccess(projectResult as? [Any])
                    
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                    onSuccess(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
