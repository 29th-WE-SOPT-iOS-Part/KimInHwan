//
//  ViewController.swift
//  week1-HW
//
//  Created by 김인환 on 2021/10/04.
//

import UIKit

class LogInViewController: UserSignViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailOrPhoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetFields()
    }
    
    //MARK: - IBAction
    @IBAction func touchNextButton(_ sender: Any) {
        requestLogin()
    }
    
    @IBAction func touchSignInButton(_ sender: UIButton) {
        let SignUpStoryboard = UIStoryboard(name: "SignUp", bundle: nil)
        guard let SignUpViewController = SignUpStoryboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        navigationController?.pushViewController(SignUpViewController, animated: true)
    }
    
    @IBAction func unwindToSignIn(_ unwindSegue: UIStoryboardSegue) {}
    
    @objc func checkFieldForNextButton(_ sender: UITextField) {
        if nameField.hasText
            && emailOrPhoneNumberField.hasText
            && passwordField.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    // MARK: - custom function
    func addTargetFields() {
        [nameField, emailOrPhoneNumberField, passwordField].forEach({$0?.addTarget(self, action: #selector(checkFieldForNextButton(_:)), for: .editingChanged)})
    }
}

//MARK: - Networking
extension LogInViewController {
    func requestLogin() {
        UserSignService.shared.logIn(email: emailOrPhoneNumberField.text ?? "" , password: passwordField.text ?? "" ) { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? SignResponseData else { return }
                if let responseData = response.data {
                    self.resultAlert(title: "로그인", message: response.message) {
                        self.presentConfirmViewController(name: responseData.name)
                    }
                }
            case .pathErr:
                self.resultAlert(title: "로그인", message: "요청 경로 에러")
            case .serverErr:
                self.resultAlert(title: "로그인", message: "서버 내 오류")
            case .networkFail:
                self.resultAlert(title: "로그인", message: "통신에 알 수 없는 문제가 생겼습니다.")
            case .requestErr(let loginResponse):
                guard let response = loginResponse as? SignResponseData else { return }
                self.resultAlert(title: "로그인", message: response.message)
            }
        }
    }
}
