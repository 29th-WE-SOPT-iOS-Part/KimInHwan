//
//  UserSignViewController.swift
//  29th-iOS-HW
//
//  Created by 김인환 on 2021/11/11.
//

import UIKit

class UserSignViewController: UIViewController {
    
    public func resultAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: .default) { _ in
            if let completion: (() -> Void) = completion {
                completion()
            } else { return }
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    public func presentConfirmViewController(name: String) {
        let confirmStoryBoard = UIStoryboard(name: "Confirm", bundle: nil)
        guard let confirmViewController = confirmStoryBoard.instantiateViewController(withIdentifier: "confirmViewController") as? ConfirmViewController else { return }
        
        confirmViewController.nameToSet = name
        confirmViewController.modalPresentationStyle = .fullScreen
        present(confirmViewController, animated: true)
    }
    
}
