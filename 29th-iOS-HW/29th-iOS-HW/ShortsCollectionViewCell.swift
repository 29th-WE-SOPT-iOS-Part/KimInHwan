//
//  ShortsCollectionViewCell.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/10/28.
//

import UIKit

class ShortsCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ShortsCollectionViewCell"

    @IBOutlet weak var shortsThumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutShortsThumbnailImage()
    }
    
    func layoutShortsThumbnailImage() {
        shortsThumbnailImage.layer.cornerRadius = CGFloat(10)
        shortsThumbnailImage.layer.masksToBounds = true
    }

}
