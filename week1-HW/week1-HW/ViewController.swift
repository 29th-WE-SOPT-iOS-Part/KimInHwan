//
//  ViewController.swift
//  week1-HW
//
//  Created by 김인환 on 2021/10/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailOrPhoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetFields()
    }
    
    func addTargetFields() {
        nameField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        emailOrPhoneNumberField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
    }
    
    @objc func checkFieldForNextButton(_ sender: UITextField) {
        if nameField.hasText
            && emailOrPhoneNumberField.hasText
            && passwordField.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let confirmVC: ConfirmViewController = segue.destination as? ConfirmViewController else { return }
        
        confirmVC.nameToSet = nameField.text
    }
}
