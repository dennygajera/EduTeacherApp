//
//  UICollectionViewExtensions.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 13/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
import UIKit
// UICollectionView extensions should be added / made in this Class only
extension UICollectionView {
    
}

//MARK:- UICollectionViewCell Extensions
extension UICollectionViewCell{
    static var cellId: String {
        return String(describing: self.self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: cellId, bundle: nil)
    }
}
