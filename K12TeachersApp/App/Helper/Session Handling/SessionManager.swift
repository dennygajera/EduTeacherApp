
import Foundation
import UIKit

class SessionManager {
    
    static var loginInfo : LoginModel? = nil
    static var userName = String()
    static var accessToken = String()
    static var academic_profile : [Academic_profile]?
    
    static func updateRootVC(){
        
        let status = defaults.bool(forKey: sessionKey.loggedInStatus)
        
        var rootVC : UIViewController?
        
        printMe(object: status)
        
        if(status == true){
            rootVC = revealViewSB.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
            SessionLoginInfo()
        }else{
            rootVC = authenticationSB.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
    fileprivate static func SessionLoginInfo() {
        // decoding login api and assigning data
        if let savedPerson = UserDefaults.standard.object(forKey: userLoginKey.userLoggedIn) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(LoginModel.self, from: savedPerson) {
                self.loginInfo = loadedPerson
                userName = "\(loginInfo?.personal_info?.first_name ?? "") \(loginInfo?.personal_info?.second_name ?? "")"
                accessToken = loginInfo?.personal_info?.token ?? ""
                academic_profile = loginInfo?.academic_profile
            }
        }
    }
}
