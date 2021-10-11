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

        // Do any additional setup after loading the view.
        setNameLabelText()
    }
    
    func setNameLabelText() {
        if let nameToSet = nameToSet {
            nameLabel.text = "\(nameToSet)님"
        }
    }

}
