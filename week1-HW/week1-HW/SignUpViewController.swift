//
//  SignUpViewController.swift
//  week1-HW
//
//  Created by 김인환 on 2021/10/04.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailOrPhoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rawPasswordPresentToggle: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func touchRawPasswordPresent(_ sender: UIButton) {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func touchNextButton(_ sender: UIButton) {
        guard let confirmVC: ConfirmViewController = self.storyboard?.instantiateViewController(withIdentifier: "confirmViewController") as? ConfirmViewController else { return }
        
        confirmVC.nameToSet = nameField.text
        
        confirmVC.modalPresentationStyle = .fullScreen
        self.present(confirmVC, animated: true, completion: nil)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        emailOrPhoneNumberField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        rawPasswordPresentToggle.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        rawPasswordPresentToggle.setImage(UIImage(systemName: "square"), for: .normal)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

}
