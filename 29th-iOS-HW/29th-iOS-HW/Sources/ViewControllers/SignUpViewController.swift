//
//  SignUpViewController.swift
//  week1-HW
//
//  Created by 김인환 on 2021/10/04.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailOrPhoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rawPasswordPresentToggle: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetFields()
        setPasswordToggleImage()
    }
    
    //MARK: - IBAction
    @IBAction func touchRawPasswordPresent(_ sender: UIButton) {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
        sender.isSelected.toggle()
    }
    
    @IBAction func touchNextButton(_ sender: UIButton) {
        requestSignUp()
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
    
    //MARK: - custom function
    func addTargetFields() {
        [nameField, emailOrPhoneNumberField, passwordField].forEach({
            $0?.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)})
    }
    
    func setPasswordToggleImage() {
        rawPasswordPresentToggle.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        rawPasswordPresentToggle.setImage(UIImage(systemName: "square"), for: .normal)
    }
    
    func signUpResultAlert(title: String, message: String, isSucceed: Bool) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: .default) { _ in
            if isSucceed {
                self.presentConfirmViewController()
            }
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func presentConfirmViewController() {
        let confirmStoryBoard = UIStoryboard(name: "Confirm", bundle: nil)
        guard let confirmViewController = confirmStoryBoard.instantiateViewController(withIdentifier: "confirmViewController") as? ConfirmViewController else { return }
        
        confirmViewController.nameToSet = self.nameField.text
        confirmViewController.modalPresentationStyle = .fullScreen
        present(confirmViewController, animated: true)
    }
}

//MARK: - Network Extension
extension SignUpViewController {
    func requestSignUp() {
        UserSignService.shared.signUp(email: emailOrPhoneNumberField.text ?? "", password: passwordField.text ?? "", name: nameField.text ?? "") { responseData in
            switch responseData {
            case .success(let signUpResponse):
                guard let response = signUpResponse as? SignResponseData else { return }
                if let userData = response.data {
                    self.signUpResultAlert(title: "회원가입", message: response.message, isSucceed: true)
                }
            case .requestErr(let signUpResponse):
                guard let response = signUpResponse as? SignResponseData else { return }
                self.signUpResultAlert(title: "회원가입", message: response.message, isSucceed: false)
            case .pathErr:
                self.signUpResultAlert(title: "회원가입", message: "요청 경로 에러", isSucceed: false)
            case .serverErr:
                self.signUpResultAlert(title: "회원가입", message: "서버 내 오류", isSucceed: false)
            case .networkFail:
                self.signUpResultAlert(title: "회원가입", message: "통신에 알 수 없는 문제가 생겼습니다.", isSucceed: false)
            }
            
        }
    }
}
