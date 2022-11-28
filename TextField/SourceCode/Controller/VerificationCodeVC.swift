//
//  VerificationCodeVC.swift
//  RachelPaigeXO
//
//  Created by Webappclouds on 23/11/22.
//

import UIKit

class VerificationCodeVC: UIViewController {
    @IBOutlet weak var veriCode1TxtFld: BackspaceTextField!
    @IBOutlet weak var veriCode2TxtFld: BackspaceTextField!
    @IBOutlet weak var veriCode3TxtFld: BackspaceTextField!
    @IBOutlet weak var veriCode4TxtFld: BackspaceTextField!
    @IBOutlet weak var veriCode5TxtFld: BackspaceTextField!
    @IBOutlet weak var veriCode6TxtFld: BackspaceTextField!
    
    var textFieldsArr: [BackspaceTextField] {
        return [veriCode1TxtFld, veriCode2TxtFld, veriCode3TxtFld, veriCode4TxtFld, veriCode5TxtFld, veriCode6TxtFld]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        self.navigationController?.navigationBar.isHidden = true
        setDelegateForTextFields()
    }
    
    @IBAction func submitBtnClicked() {
        let sb = UIStoryboard.init(name: "Main", bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: UITextFieldDelegate
extension VerificationCodeVC: UITextFieldDelegate, BackspaceTextFieldDelegate {
    private func setDelegateForTextFields() {
        textFieldsArr.forEach {
            $0.delegate = self
            $0.backspaceTextFieldDelegate = self
            $0.autocapitalizationType  = .sentences
            $0.autocorrectionType  = .no
            $0.smartDashesType  = .no
            $0.smartInsertDeleteType  = .no
            $0.smartQuotesType  = .no
            $0.spellCheckingType  = .no
            $0.keyboardType = .numberPad
            $0.returnKeyType = .done
            $0.tintColor = .textColor
        }
    }
    
    func textFieldDidEnterBackspace(_ textField: BackspaceTextField) {
        guard let index = textFieldsArr.firstIndex(of: textField) else {
            return
        }
        if index > 0 {
            textFieldsArr[index - 1].becomeFirstResponder()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == " " {
            return false
        }
        
        let resultantString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string.lowercased()
        var formattedString = resultantString.trimmingCharacters(in: CharacterSet.whitespaces)
        if formattedString.count > 1 {
            textField.text = ""
            formattedString = string
        }
        
        let text = formattedString
        if  text.count == 1 {
            guard let index = textFieldsArr.firstIndex(of: textField as! BackspaceTextField) else {
                return true
            }
            if index < textFieldsArr.count - 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    self.textFieldsArr[index + 1].becomeFirstResponder()
                }
            } else if index == textFieldsArr.count - 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    textField.resignFirstResponder()
                }
            }
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkVerificationCode()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    private func checkVerificationCode() {
       
    }
}
