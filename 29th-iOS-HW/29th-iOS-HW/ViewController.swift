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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetFields()
    }
    
    @IBAction func touchNextButton(_ sender: Any) {
        let confirmStoryBoard = UIStoryboard(name: "Confirm", bundle: nil)
        guard let confirmViewController = confirmStoryBoard.instantiateViewController(withIdentifier: "confirmViewController") as? ConfirmViewController else { return }
        
        confirmViewController.nameToSet = nameField.text
        confirmViewController.modalPresentationStyle = .fullScreen
        present(confirmViewController, animated: true, completion: nil)
    }
    
    @IBAction func touchSignInButton(_ sender: UIButton) {
        let SignUpStoryboard = UIStoryboard(name: "SignUp", bundle: nil)
        guard let SignUpViewController = SignUpStoryboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        navigationController?.pushViewController(SignUpViewController, animated: true)
    }
    @IBAction func unwindToSignIn(_ unwindSegue: UIStoryboardSegue) {
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
    
    func addTargetFields() {
        nameField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        emailOrPhoneNumberField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)
    }
}
