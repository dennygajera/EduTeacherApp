//
//  ReportDiaryFilesCVCell.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 25/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit
import AVFoundation
class ReportDiaryFilesCVCell: UICollectionViewCell {

    @IBOutlet weak var fileThumbnailImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .clear
        bgView.backgroundColor = .clear
        fileThumbnailImage.contentMode = .scaleToFill
    }
    
    var cellMedia : MediaData? {
              didSet {
                  if cellMedia?.getType == "image"{

                      fileThumbnailImage.image = UIImage(data: cellMedia!.data)
                      
                  }else if cellMedia?.getType == "video"{
                      
                      let getURL = NSURL(string: cellMedia!.getPreviewUrl)!
                      
                      fileThumbnailImage.image = self.thumbnailForVideoAtURL(url: getURL)
                      
                  }else if cellMedia?.getType == "file"{
                      
                      fileThumbnailImage.image = UIImage(named: "pdfIcon")
                      
                  }
              }
          }
    func thumbnailForVideoAtURL(url: NSURL) -> UIImage? {

        let asset = AVAsset(url: url as URL)
        let assetImageGenerator = AVAssetImageGenerator(asset: asset)

        var time = asset.duration
        time.value = min(time.value, 2)

        do {
            let imageRef = try assetImageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch {
            print("error")
            return nil
        }
    }

}
