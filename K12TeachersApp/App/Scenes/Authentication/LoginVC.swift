//
//  LoginVC.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class LoginVC: UIViewController{
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var userErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bgView: UIView!
    
    var loginVM = LoginViewModel()
    var appLabels = [UILabel]()
    var appTextFields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UpdateUI()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardDidHideNotification, object: nil)
        
        hideKeyboardWhenTappedAround()
    }
    //MARK:- Colors and font reusability
    private func UpdateUI(){
        appLabels = [userErrorLabel, passwordErrorLabel]
        appTextFields = [userIDTF, passwordTF]
        
        userIDTF.text = "rahul.kawale@orchids.edu.in"
        passwordTF.text = "Welcome@123"
        
        bgView.backgroundColor = UIColor.appBackgroundColor
        appTextFields.forEach {$0.delegate = self}
        appTextFields.forEach({$0.textColor = UIColor.appMainTitleColor})
        appTextFields.forEach {$0.font = UIFont.appMainTitleFont}
        
        loginBtn.layer.cornerRadius = btnCornerRadius
        loginBtn.backgroundColor = UIColor.appButtonBackgroundColor
        loginBtn.setTitleColor(UIColor.appButtonTitleColor, for: .normal)
        
        appLabels.forEach({$0.isHidden = true})
        appLabels.forEach({$0.textColor = UIColor.appErrorMessageColor})
        appTextFields.forEach({$0.font = UIFont.appSubTitleFont})
    }
    
    // Note: Below function moves view up when keyboard appears
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else{
                return
        }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification: Notification)
    {
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        userErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        
        guard let userID = self.userIDTF.text else { return }
        guard let password = self.passwordTF.text else { return }
        ProgressHud.showActivityIndicator(uiView: self.view)
        loginVM.LoginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                if(status) {
                    defaults.set(true, forKey: sessionKey.loggedInStatus)
                    SessionManager.updateRootVC()
                } else {
                    if(message.capitalized.contains("Invalid") || message.contains("password")){
                        self.passwordErrorLabel.isHidden = false
                        self.passwordErrorLabel.text = message
                    } else {
                        self.userErrorLabel.isHidden = false
                        self.userErrorLabel.text = message
                    }
                }
                ProgressHud.hideActivityIndicator(uiView: self.view)
            }
            
        }
        loginVM.AuthenticateUser(userID, password)
    }
}
extension LoginVC:  UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
