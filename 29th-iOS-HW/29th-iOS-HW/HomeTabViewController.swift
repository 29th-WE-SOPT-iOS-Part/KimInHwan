//
//  HomeTabViewController.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/10/27.
//

import UIKit

class HomeTabViewController: UIViewController {

    @IBOutlet weak var shortsCollectionView: UICollectionView!
    @IBOutlet weak var recommendCollectionView: UICollectionView!
    @IBOutlet weak var videoListTableView: UITableView!
    
    let videoDatas: VideoListData = VideoListData()
    let shortsDatas: ShortsIconData = ShortsIconData()
    let recommendDatas: RecommendData = RecommendData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShortsCollectionView()
        setRecommendCollectionView()
        setVideoListTableView()
    }
    
    func setShortsCollectionView() {
//        shortsCollectionView.decelerationRate = .fast
        shortsCollectionView.delegate = self
        shortsCollectionView.dataSource = self
        shortsCollectionView.register(UINib(nibName: "ShortsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: ShortsCollectionViewCell.identifier)
    }
    
    func setRecommendCollectionView() {
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
        recommendCollectionView.register(UINib(nibName: "RecommendCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
    }
    
    func setVideoListTableView() {
        videoListTableView.dataSource = self
        videoListTableView.register(UINib(nibName: "VideoListTableViewCell", bundle: .main), forCellReuseIdentifier: VideoListTableViewCell.identifier)
    }
}

extension HomeTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case shortsCollectionView:
            return shortsDatas.userList.count
        case recommendCollectionView:
            return recommendDatas.titles.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case shortsCollectionView:
            guard let cell: ShortsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortsCollectionViewCell.identifier, for: indexPath) as? ShortsCollectionViewCell else { return UICollectionViewCell() }
            
            cell.shortsThumbnailImage.image = shortsDatas.userIconList[indexPath.item]
            cell.nameLabel.text = shortsDatas.userList[indexPath.item]
            return cell

        case recommendCollectionView:
            guard let cell: RecommendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else { return UICollectionViewCell() }
            
            cell.tagLabel.text = recommendDatas.titles[indexPath.item]
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case shortsCollectionView:
            return CGSize(width: 72, height: 104)
        case recommendCollectionView:
            let dummyLabel: UILabel = UILabel()
            dummyLabel.font = .systemFont(ofSize: 14)
            dummyLabel.text = recommendDatas.titles[indexPath.item]
            
            return CGSize(width: dummyLabel.frame.width, height: 32)
        default:
            return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case recommendCollectionView:
            return UIEdgeInsets(top: 8, left: 13, bottom: 8, right: 13)
        default:
            return UIEdgeInsets()
        }
    }
}

extension HomeTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoDatas.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: VideoListTableViewCell = tableView.dequeueReusableCell(withIdentifier: VideoListTableViewCell.identifier, for: indexPath) as? VideoListTableViewCell else { return UITableViewCell() }
        
        cell.thumbnailImage.image = UIImage(named: "wesoptiOSPart")
        cell.userProfileImage.image = UIImage(named: "wesoptProfile")
        cell.videoTitleLabel.text = videoDatas.titles[indexPath.row]
        cell.metadataLabel.text = "WE SOPT ・조회수 100만회 ・ 3주 전"
        
        return cell
    }
}
