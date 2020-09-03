//
//  LandingInfoVC.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class LandingInfoVC: BaseVC {

    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Info"
        
        userName = SessionManager.userName
        userNameLabel.textColor = UIColor.appMainTitleColor
        userNameLabel.font = UIFont.appMainTitleFont
        userNameLabel.textAlignment = .left
        gifImage.image = UIImage.gifImageWithName("LandingPageLogo")
        timeGreetings()
    }
    
    //GREETINGS FUNCTION FOR SHOWING TIME AM & PM
    func timeGreetings(){
        let dateComponents = Calendar.current.dateComponents([.hour], from: Date())
        if let hour = dateComponents.hour {
            switch hour {
            case 0..<12:
                userNameLabel.text = "Good Morning \(userName)"
            case 12..<17:
                userNameLabel.text = "Good Afternoon \(userName)"
            default:
                userNameLabel.text = "Good Evening \(userName)"
            }
        }
    }
}
