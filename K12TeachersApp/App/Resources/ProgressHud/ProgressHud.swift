//
//  ProgressHud.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 20/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
class ProgressHud {
    
//    static let sharedProgessHud = ProgressHud()
    
   static var container: UIView = UIView()
   static var loadingView: UIView = UIView()
   static var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static var loadingImage : UIImageView = UIImageView()
    
    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     
     @param uiView - add activity indicator to this view
     */
   static func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        //container.backgroundColor = HexColor("#333333", alpha: 0.3)
        container.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.6025803257) //UIColor(red:0.20, green:0.20, blue:0.20, alpha:0.3)
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        //loadingView.backgroundColor = HexColor("#444444", alpha: 0.7)
        loadingView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        loadingImage.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
//        loadingImage.style = UIActivityIndicatorView.Style.whiteLarge
        loadingImage.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        loadingImage.image = UIImage(named: "LoaderImage")
        
        loadingView.addSubview(loadingImage)
        container.addSubview(loadingView)
        uiView.addSubview(container)
//        activityIndicator.startAnimating()
    roatateImageView()
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     
     @param uiView - remove activity indicator from this view
     */
   static func hideActivityIndicator(uiView: UIView) {
//        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    static func roatateImageView(){
//        UIView.animate(withDuration: 2,delay: 0,options: .curveLinear, animations: () -> Void) {
//
//            self.loadingImage.transform = self.loadingImage.transform.rotated(by: 10 / 2)
//
//        }
        
        UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear, animations: {() in
            self.loadingImage.transform = self.loadingImage.transform.rotated(by: CGFloat(Double.pi / 2))
        },completion: {(commpleted) in
            self.roatateImageView()
            })
        
    }
    /*
     Define UIColor from hex value
     
     @param rgbValue - hex color value
     @param alpha - transparency level
     */
    //    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    //        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    //        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    //        let blue = CGFloat(rgbValue & 0xFF)/256.0
    //        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    //    }
    
}


