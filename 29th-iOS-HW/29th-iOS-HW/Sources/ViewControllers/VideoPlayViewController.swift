//
//  VideoPlayViewController.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/12/21.
//

import UIKit

class VideoPlayViewController: UIViewController {
    
    // MARK: - Properties
    
    static let identifier: String = "VideoPlayViewController"
    
    var thumbnailImageToSet: UIImage?
    var videoTitleTextToSet: String?
    var metadataTextToSet: String?
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setReceivedData()
    }
    
    @IBAction func touchBackwardButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func setReceivedData() {
        thumbnailImageView.image = thumbnailImageToSet
        videoTitleLabel.text = videoTitleTextToSet
        metadataLabel.text = metadataTextToSet
    }

}
