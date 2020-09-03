//
//  StringExtensions.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation

// String extensions should be added / made in this Class only 
extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    
    subscript(_ i: Int) -> String {
        let idx1 = index(startIndex, offsetBy: i)
        let idx2 = index(idx1, offsetBy: 1)
        return String(self[idx1..<idx2])
    }
    
    //MARK:- Validate Email or PhoneNumber
    func validateAsEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    
    func validateAsPhone() -> Bool {
        let phoneRegEx = "^[0-9'@s]{10}$"
        
        let phoneTest = NSPredicate(format:"SELF MATCHES[c] %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
     //MARK:- Capitalize First Letter
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}




extension String {
    
}


