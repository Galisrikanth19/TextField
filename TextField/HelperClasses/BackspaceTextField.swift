//
//  BackspaceTextField.swift
//  VerificationCode
//
//  Created by Webappclouds on 28/11/22.
//

import UIKit

protocol BackspaceTextFieldDelegate: AnyObject {
    func textFieldDidEnterBackspace(_ textField: BackspaceTextField)
}

class BackspaceTextField: UITextField {
    weak var backspaceTextFieldDelegate: BackspaceTextFieldDelegate?

    override func deleteBackward() {
        if text?.isEmpty ?? false {
            backspaceTextFieldDelegate?.textFieldDidEnterBackspace(self)
        }
        super.deleteBackward()
    }
}
