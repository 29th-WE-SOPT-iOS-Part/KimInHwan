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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension HomeTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension HomeTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: VideoListTableViewCell = tableView.dequeueReusableCell(withIdentifier: VideoListTableViewCell.identifier, for: indexPath.row) as? VideoListTableViewCell else { return UITableViewCell() }
        
        switch indexPath.row {
            case 
        }
        
        return cell
    }
}
