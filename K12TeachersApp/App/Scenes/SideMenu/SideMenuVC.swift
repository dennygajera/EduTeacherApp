//
//  SideMenuVC.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var logoutBtn: UIButton!
    
    @IBOutlet weak var teacherNameLabel: UILabel!
    
    var sideMenuVM = SideMenuViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
        updateTableView()
        sideMenuVM.getSideMenuDetails { () -> Void? in
            DispatchQueue.main.async {
                printMe(object: "Reloaad \(self.sideMenuVM.sideMenuModelArray)")
            }
        }
    }
    
    func UpdateUI() {
        view.backgroundColor = UIColor.appSideMenuBackgroundColor
        logoutBtn.setTitleColor(UIColor.appErrorMessageColor, for: .normal)
        logoutBtn.titleLabel?.font = UIFont.appButtonTitleFont
        teacherNameLabel.textColor = UIColor.appMainTitleColor
        teacherNameLabel.font = UIFont.appUserNameFont
        teacherNameLabel.numberOfLines = 0
        teacherNameLabel.text = SessionManager.userName
    }
    
    func updateTableView(){
        sideMenuTableView.register(SideMenuTVCell.cellNib, forCellReuseIdentifier: SideMenuTVCell.cellId)
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self
        sideMenuTableView.backgroundColor = .clear
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        defaults.set(false, forKey: sessionKey.loggedInStatus)
        SessionManager.updateRootVC()
    }
    
    @IBAction func btnHome(_ sender: Any) {
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "LandingInfo", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "LandingInfoVC")
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
    }
    
}

extension SideMenuVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuVM.sideMenuModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTVCell.cellId, for: indexPath) as! SideMenuTVCell
        cell.sideMenuItem = sideMenuVM.sideMenuModelArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        let mainstoryboard:UIStoryboard = UIStoryboard(name: sideMenuVM.sideMenuModelArray[indexPath.row].sideMenu_sbName ?? "", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: sideMenuVM.sideMenuModelArray[indexPath.row].sideMenu_VC ?? "")
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
    }
    
}
