//
//  LoginVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit


class LoginVC: UIViewController {
    
    private let usernameEmailTF: UITextField = {
        return UITextField()
    }()
    
    private let passwordTF: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginBtn: UIButton = {
        return UIButton()
    }()
    
    private let createAccountBtn: UIButton = {
        return UIButton()
    }()

    
    private let termsBtn: UIButton = {
        return UIButton()
    }()
    
    private let privacyBtn: UIButton = {
        return UIButton()
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSubviews()
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginBtn)
        view.addSubview(createAccountBtn)
        view.addSubview(termsBtn)
        view.addSubview(privacyBtn)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginBtn() {}
    
    @objc private func didTapTermsBtn() {}
    
    @objc private func didTapPrivacyBtn() {}
    
    @objc private func didTapCreateAccountBtn() {}
    

}
