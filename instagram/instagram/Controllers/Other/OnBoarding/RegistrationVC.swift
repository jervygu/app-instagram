//
//  RegistrationVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit

class RegistrationVC: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 5.0
    }
    
    private let usernameTF: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 10,
                                              height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
    }()
    
    private let emailTF: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Address"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 10,
                                              height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
    }()
    
    private let passwordTF: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 10,
                                              height: 0))
        field.autocapitalizationType = .none
        field.isSecureTextEntry = true
        field.autocorrectionType = .no
        field.returnKeyType = .go
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        
        return field
    }()
    
    private let registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.backgroundColor = .systemGreen
        btn.setTitleColor(.white, for: .normal)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerBtn.addTarget(self, action: #selector(didTappedRegister), for: .touchUpInside)
        
        usernameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
        
        view.addSubview(usernameTF)
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(registerBtn)
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameTF.frame = CGRect(
            x: 20,
            y: view.safeAreaInsets.top + 100,
            width: view.width - 40.0,
            height: 52.0)
        
        emailTF.frame = CGRect(
            x: 20,
            y: usernameTF.bottom + 10,
            width: view.width - 40.0,
            height: 52.0)
        
        passwordTF.frame = CGRect(
            x: 20,
            y: emailTF.bottom + 10,
            width: view.width - 40.0,
            height: 52.0)
        
        registerBtn.frame = CGRect(
            x: 20,
            y: passwordTF.bottom + 10,
            width: view.width - 40.0,
            height: 52.0)
    }
    
    @objc private func didTappedRegister() {
        usernameTF.resignFirstResponder()
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty, password.count >= 8,
              let username = usernameTF.text, !username.isEmpty else {
            return
        }
        
        AuthManager.shared.registerNewUser(withUsername: username, withEmail: email, withPassword: password) { (registered) in
            if registered {
                // good to go
            } else {
                // failed registration
            }
        }
        
        
    }
    
}

extension RegistrationVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            emailTF.becomeFirstResponder()
        } else if textField == passwordTF {
            passwordTF.becomeFirstResponder()
        } else {
            didTappedRegister()
        }
        return true
    }
}
