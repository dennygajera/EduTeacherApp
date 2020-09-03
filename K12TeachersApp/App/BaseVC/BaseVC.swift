//
//  BaseVC.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appBackgroundColor
        
        // To set Hamberger Menu action
        let menuImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30.0, height: 40.0))
        menuImageView.image = #imageLiteral(resourceName: "Menu")
        menuImageView.contentMode = .scaleAspectFit
        let menuBarButton = UIBarButtonItem(customView: menuImageView)
        menuBarButton.customView?.addGestureRecognizer(UITapGestureRecognizer(target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:))))
        navigationItem.setLeftBarButton(menuBarButton, animated: false)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        
        // To set navigation bar transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.appNavigationTitleColor,
                              NSAttributedString.Key.font: UIFont.appNavigationTitleFont]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.appNavigationTitleColor
    }
     
}
