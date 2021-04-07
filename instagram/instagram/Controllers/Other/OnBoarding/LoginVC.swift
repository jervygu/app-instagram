//
//  LoginVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit
import SafariServices


class LoginVC: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 5.0
    }
    
    private let usernameEmailTF: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or email"
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
    
    private let loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        
        return btn
    }()
    
    private let createAccountBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Don't have an account? Sign Up.", for: .normal)
//        btn.layer.masksToBounds = true
//        btn.layer.cornerRadius = Constants.cornerRadius
//        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.label, for: .normal)
        
        return btn
    }()

    
    private let termsBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Terms of Service", for: .normal)
//        btn.layer.masksToBounds = true
//        btn.layer.cornerRadius = Constants.cornerRadius
//        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.secondaryLabel, for: .normal)
        
        
        return btn
    }()
    
    private let privacyBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Privacy Policy", for: .normal)
//        btn.layer.masksToBounds = true
//        btn.layer.cornerRadius = Constants.cornerRadius
//        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.secondaryLabel, for: .normal)
        
        return btn
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
//        header.backgroundColor = .red
        
        let bgImgView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(bgImgView)
        
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        loginBtn.addTarget(self, action: #selector(didTapLoginBtn), for: .touchUpInside)
        createAccountBtn.addTarget(self, action: #selector(didTapCreateAccountBtn), for: .touchUpInside)
        termsBtn.addTarget(self, action: #selector(didTapTermsBtn), for: .touchUpInside)
        privacyBtn.addTarget(self, action: #selector(didTapPrivacyBtn), for: .touchUpInside)
        
        usernameEmailTF.delegate = self
        passwordTF.delegate = self
        
        addSubviews()
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
        headerView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width, // or view.frame.size.width,
            height: view.height / 3.0)
        
        usernameEmailTF.frame = CGRect(
            x: 25.0,
            y: headerView.bottom + 30.0,
            width: view.width - 50.0,
            height: 52.0)
        
        passwordTF.frame = CGRect(
            x: 25,
            y: usernameEmailTF.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        loginBtn.frame = CGRect(
            x: 25,
            y: passwordTF.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        createAccountBtn.frame = CGRect(
            x: 25,
            y: loginBtn.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        termsBtn.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width - 20,
            height: 50)
        
        privacyBtn.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width - 20,
            height: 50)
        
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let bgView = headerView.subviews.first else {
            return
        }
        
        bgView.frame = headerView.bounds
        
        // add instagram logo
        let imgView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imgView)
        
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(
            x: headerView.width / 4.0,
            y: view.safeAreaInsets.top,
            width: headerView.width / 2.0,
            height: headerView.height - view.safeAreaInsets.top)
        
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
    
    @objc private func didTapLoginBtn() {
        passwordTF.resignFirstResponder()
        usernameEmailTF.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailTF.text, !usernameEmail.isEmpty,
              let password = passwordTF.text, !password.isEmpty, password.count >=  8 else {
            return
        }
        
        // login functionality
        
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            // email
            email = usernameEmail
        } else {
            // username
            username = usernameEmail
        }
        AuthManager.shared.loginUser(username: username, email: email, password: password) { (success) in
            DispatchQueue.main.async {
                if success {
                    // user loggedin
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // error occurred
                    let alert = UIAlertController(title: "Login error", message: "We were unable to log you in.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc private func didTapTermsBtn() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func didTapPrivacyBtn() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func didTapCreateAccountBtn() {
        let vc = RegistrationVC()
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    

}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            didTapLoginBtn()
        }
        
        return true
    }
}
