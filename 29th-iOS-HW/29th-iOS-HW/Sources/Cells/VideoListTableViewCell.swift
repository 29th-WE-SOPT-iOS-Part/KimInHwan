//
//  VideoListTableViewCell.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/10/28.
//

import UIKit

protocol VideoListTableViewCellDelegate {
    func didTouchThumbnailImage(cell: VideoListTableViewCell)
}

class VideoListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "VideoListTableViewCell"
    var delegate: VideoListTableViewCellDelegate?
    
    // MARK: - IBOutlet

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setGestureRecognizer()
    }
    
    func setGestureRecognizer() {
        let gestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchThumbnailImage(_:)))
        thumbnailImage.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func touchThumbnailImage(_ sender: UIGestureRecognizer) {
        delegate?.didTouchThumbnailImage(cell: self)
    }
}
