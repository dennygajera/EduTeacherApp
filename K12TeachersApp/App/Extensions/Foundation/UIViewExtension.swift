//
//  UIViewExtension.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation

extension UIView {
    
    func applyDefaultShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 2.0
    }
    
    func appDefaultCornerRadius() {
        self.layer.cornerRadius = 8
    }
    
    func applyTopCornerRadius() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
