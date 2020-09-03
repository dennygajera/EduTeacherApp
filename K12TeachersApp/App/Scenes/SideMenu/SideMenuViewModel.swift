//
//  SideMenuVM.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class SideMenuViewModel: NSObject {
    
    var sideMenuModelArray = [SideMenuModel]()
    
    func getSideMenuDetails(completion: (() -> Void?)){
        SideMenuManager.sharedInstance.getSideMenuResponse(onSuccess: {json in
            let array = json as? [JSON]
            for dictionary in array! {
                guard let Menu_Items = SideMenuModel(json: dictionary) else { continue }
                self.sideMenuModelArray.append(Menu_Items)
            }
            
        })
    }
}
