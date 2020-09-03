//
//  LoadMoreTVCell.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class LoadMoreTVCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var loaderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roatateImageView()
    }
    
     func roatateImageView(){
        UIView.animate(withDuration: 2.0, delay: 0, options: .curveLinear, animations: {() in
            self.loaderImage.transform = self.loaderImage.transform.rotated(by: CGFloat(Double.pi / 2))
        },completion: {(commpleted) in
            self.roatateImageView()
        })
        
    }    
}
