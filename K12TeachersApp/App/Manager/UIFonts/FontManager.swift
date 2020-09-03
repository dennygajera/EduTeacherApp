//
//  FontManager.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    //
    public static var appNavigationTitleFont : UIFont {
        get {
            return UIFont.PoppinsMedium(size: 23)
        }
    }
    //
    public static var appMainTitleFont : UIFont {
        get {
            return UIFont.PoppinsRegular(size: 18)
        }
    }
    //
    public static var appSubTitleFont : UIFont {
        get {
            return UIFont.PoppinsMedium(size: 14)
        }
    }
    //
    public static var appButtonTitleFont : UIFont {
        get {
            return UIFont.PoppinsSemiBold(size: 14)
        }
    }
    //
    public static var appUserNameFont : UIFont {
        get {
            return UIFont.PoppinsSemiBold(size: 18)
        }
    }
    //
    public  static var segmentSelectedFont :UIFont {
        get{
            return UIFont.PoppinsMedium(size: 16)
        }
    }
    //
    public  static var segmentDeSelectedFont :UIFont {
        get{
            return UIFont.PoppinsRegular(size: 16)
        }
    }

}
