//
//  RecommendCollectionViewCell.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/10/28.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "RecommendCollectionViewCell"

    @IBOutlet weak var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutCell()
    }
    
    func layoutCell() {
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
        layer.masksToBounds = true
    }

}
