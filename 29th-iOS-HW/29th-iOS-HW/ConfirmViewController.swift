//
//  ConfirmViewController.swift
//  week1-HW
//
//  Created by 김인환 on 2021/10/04.
//

import UIKit

class ConfirmViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var nameToSet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameLabelText()
    }
    
    @IBAction func touchNextButton(_ sender: UIButton) {
        let tabbarStoryboard = UIStoryboard(name: "Tabbar", bundle: nil)
        guard let tabbarViewController = tabbarStoryboard.instantiateViewController(withIdentifier: "TabbarViewController") as? TabbarViewController else { return }
        tabbarViewController.modalPresentationStyle = .fullScreen
        present(tabbarViewController, animated: true, completion: nil)
    }
    
    func setNameLabelText() {
        if let nameToSet = nameToSet {
            nameLabel.text = "\(nameToSet)님 환영합니다"
        }
    }
    
}
