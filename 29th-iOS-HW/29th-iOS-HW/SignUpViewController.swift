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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetFields()
        setPasswordToggleImage()
    }
    
    @IBAction func touchRawPasswordPresent(_ sender: UIButton) {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func touchNextButton(_ sender: UIButton) {
        let confirmStoryBoard = UIStoryboard(name: "Confirm", bundle: nil)
        guard let confirmViewController = confirmStoryBoard.instantiateViewController(withIdentifier: "confirmViewController") as? ConfirmViewController else { return }
        
        confirmViewController.nameToSet = nameField.text
        
        confirmViewController.modalPresentationStyle = .fullScreen
        present(confirmViewController, animated: true, completion: nil)
    }
    
    func addTargetFields() {
        nameField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        emailOrPhoneNumberField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
    }
    
    func setPasswordToggleImage() {
        rawPasswordPresentToggle.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        rawPasswordPresentToggle.setImage(UIImage(systemName: "square"), for: .normal)
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
}
