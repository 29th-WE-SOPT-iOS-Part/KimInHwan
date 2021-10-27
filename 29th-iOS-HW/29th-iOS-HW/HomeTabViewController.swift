//
//  HomeTabViewController.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/10/27.
//

import UIKit

class HomeTabViewController: UIViewController {

    @IBOutlet weak var shortsCollectionView: UICollectionView!
    @IBOutlet weak var videoListTableView: UITableView!
    
    let videoDatas: VideoListData = VideoListData()
    let shortsDatas: ShortsIconData = ShortsIconData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShortsCollectionView()
        setVideoListTableView()
    }
    
    func setShortsCollectionView() {
        shortsCollectionView.delegate = self
        shortsCollectionView.dataSource = self
        shortsCollectionView.register(UINib(nibName: "ShortsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: ShortsCollectionViewCell.identifier)
    }
    
    func setVideoListTableView() {
        videoListTableView.dataSource = self
        videoListTableView.register(UINib(nibName: "VideoListTableViewCell", bundle: .main), forCellReuseIdentifier: VideoListTableViewCell.identifier)
    }
}

extension HomeTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shortsDatas.userList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ShortsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortsCollectionViewCell.identifier, for: indexPath) as? ShortsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.shortsThumbnailImage.image = shortsDatas.userIconList[indexPath.item]
        cell.nameLabel.text = shortsDatas.userList[indexPath.item]
        
        return cell
    }
}

extension HomeTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
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
