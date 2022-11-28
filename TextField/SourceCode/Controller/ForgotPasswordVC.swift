//
//  ForgotPasswordVC.swift
//  TextField
//
//  Created by Webappclouds on 28/11/22.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var confirmPasswordTxtFld: UITextField!
    
    var textFieldsArr: [UITextField] {
        return [passwordTxtFld, confirmPasswordTxtFld]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        setDelegateForTextFields()
    }
}

// MARK: UITextFieldDelegate
extension ForgotPasswordVC: UITextFieldDelegate {
    private func setDelegateForTextFields() {
        textFieldsArr.forEach {
            $0.delegate = self
            $0.enablePasswordToggle()
            $0.setupTextFieldPlaceholder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
