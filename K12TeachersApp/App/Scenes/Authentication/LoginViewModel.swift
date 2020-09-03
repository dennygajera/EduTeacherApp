//
//  LoginVM.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    
    typealias loginCallBack = (_ status : Bool, _ message : String) -> Void
    var loginUserCallback : loginCallBack?
    var payload1 = [String: String]()
    
    //MARK:- Authenticating user
    func AuthenticateUser(_ userID: String, _ password: String){
        if(userID.count != 0) {
            if(password.count != 0){
                VerifyUser(userID, password)
            } else {
                // if password is empty
                self.loginUserCallback?(false, "password required")
            }
        } else {
            // if userID is empty
            self.loginUserCallback?(false, "UserID required")
        }
    }
    
    //MARK:- verifyUser api with credentials
    private func VerifyUser(_ userID: String, _ password: String){

        payload1["username"] = userID
        payload1["password"] = password
        
        printMe(object: "Payload = \(payload1)")
        ApiHelper.shared.loginRequest(payload: payload1 as JSON, success: { (successJson) in
            
            let loginInfo = try! JSONDecoder().decode(LoginModel.self, from: successJson)
            if(loginInfo.personal_info?.token == nil){
                let statusMessage = try! JSONDecoder().decode(CommonStatusModel.self, from: successJson)
                self.loginUserCallback?(false, statusMessage.status ?? "-NA-")
            }else{
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(loginInfo) {
                    defaults.set(encoded, forKey: userLoginKey.userLoggedIn)
                }
                self.loginUserCallback?(true, "Succesfully Logged")
            }
        }) { (err) in
            print("Err:\(err)")
        }
    }
    
    //MARK:- Login completion handler
    func LoginCompletionHandler(callBack: @escaping loginCallBack){
        self.loginUserCallback = callBack
    }
    
}
