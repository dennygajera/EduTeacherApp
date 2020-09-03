//
//  SideMenuModel.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
import UIKit

struct SideMenuModel {
    var sideMenu_Name: String?
    var sideMenu_image: String?
    var sideMenu_VC: String?
    var sideMenu_sbName: String?
    
    public init?(json: JSON) {
        self.sideMenu_Name = json["sideMenuName"] as? String
        self.sideMenu_image = json["sideMenuImage"] as? String
        self.sideMenu_VC = json["sideMenuVC"] as? String
        self.sideMenu_sbName = json["storyboardName"] as? String
    }
}
