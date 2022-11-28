//
//  UITextFieldExtensions.swift
//  TextField
//
//  Created by Webappclouds on 28/11/22.
//

import UIKit

extension UITextField {
    func enablePasswordToggle() {
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(20))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if isSecureTextEntry {
            button.setImage(UIImage(named: "password_hidden"), for: .normal)
        } else {
            button.setImage(UIImage(named: "password_show"), for: .normal)
        }
    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}

extension UITextField {
    func setupTextFieldPlaceholder(WithColor placeholderColor: UIColor? = nil) {
         let txtFldPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                    attributes: [NSAttributedString.Key.foregroundColor: (placeholderColor == nil ? (self.textColor ?? UIColor.white) : placeholderColor!)])
        self.attributedPlaceholder = txtFldPlaceholder
    }
}
