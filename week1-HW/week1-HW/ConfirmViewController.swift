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
    
    @IBAction func touchNextButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setNameLabelText() {
        if let nameToSet = nameToSet {
            nameLabel.text = "\(nameToSet)님"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNameLabelText()
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
