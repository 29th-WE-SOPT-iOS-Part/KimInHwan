//
//  VideoListTableViewCell.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/10/28.
//

import UIKit

class VideoListTableViewCell: UITableViewCell {
    
    static let identifier: String = "VideoListTableViewCell"

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
