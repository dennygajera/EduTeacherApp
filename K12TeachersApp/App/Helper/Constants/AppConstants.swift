//
//  Constants.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
import UIKit

//MARK: All constants should be taken here

/*SETTING USER DEFAULTS*/
let defaults = UserDefaults.standard

/*DEVELOPMENT TOOLS ENABLE TRUE OR FALSE*/
var shouldEnableDevTools = true
var shouldEnableConsoleLogs = UserDefaults.standard.value(forKey: "shouldEnableConsoleLogs") as? Bool ?? true

/*SETTING APP CORNER RADIUS*/
let btnCornerRadius:CGFloat = 20.0
let appTabBarCornerRadius: CGFloat = 30.0

/* APP PAGE SIZES */
let blogsPageSize: Int = 12


/*USER ENTERED DETAILS DEFAULTS*/
struct sessionKey {
    static var loggedInStatus = "loggedInStatus"

}
struct userLoginKey {
    static var userLoggedIn = "userLoggedIn"
}

// Use this print me function to enable print statement when debugging only
func printMe(object: Any) {
    #if DEBUG
        Swift.print(object)
    #endif
}
