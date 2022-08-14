//
//  LoginViewController.swift
//  Instagram
//
//  Created by Nathaniel Whittington on 8/13/22.
//

import SafariServices
import UIKit

class LoginViewController: UIViewController {
    
    struct Constants{
        
        static let cornerRadius = 8.0
    }

    private let usernameField: UITextField = {
       let usernameField = UITextField()
        usernameField.placeholder = "Username or Email.."
        usernameField.returnKeyType = .next
        usernameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        usernameField.autocorrectionType = .no
        usernameField.autocapitalizationType = .none
        usernameField.layer.masksToBounds = true
        usernameField.layer.cornerRadius = Constants.cornerRadius
        usernameField.backgroundColor = .systemBackground
        usernameField.layer.borderWidth = 1.0
        usernameField.layer.borderColor = UIColor.secondaryLabel.cgColor
       return usernameField
    }()
    
    private let passworField: UITextField = {
       let passwordField = UITextField()
        passwordField.isSecureTextEntry = true
        passwordField.placeholder = "Password.."
        passwordField.returnKeyType = .continue
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        passwordField.autocorrectionType = .no
        passwordField.autocapitalizationType = .none
        passwordField.layer.masksToBounds = true
        passwordField.layer.cornerRadius = Constants.cornerRadius
        passwordField.backgroundColor = .systemBackground
        passwordField.layer.borderWidth = 1.0
        passwordField.layer.borderColor = UIColor.secondaryLabel.cgColor
        return passwordField
       
    }()
    
    private let termsButton: UIButton = {
        let termsButton = UIButton()
        termsButton.setTitle("Terms of Service", for: .normal)
        termsButton.setTitleColor(UIColor.secondaryLabel, for: .normal)
        return termsButton
    }()
    
    private let privacyButton: UIButton = {
        let privacyButton = UIButton()
        privacyButton.setTitle("Privacy Policy", for: .normal)
        privacyButton.setTitleColor(UIColor.secondaryLabel, for: .normal)
        return privacyButton
    }()
    
    private let createAccountButton: UIButton = {
        let createAccountButton = UIButton()
        createAccountButton.setTitleColor(UIColor.label, for: .normal)
        createAccountButton.setTitle("New User? Create An Account", for: .normal)
        return createAccountButton
    }()
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.clipsToBounds = true
        let backgroundView = UIImageView(image: UIImage(named: "gradient"))
        headerView.addSubview(backgroundView)
        return headerView
    }()
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = Constants.cornerRadius
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(UIColor.white, for: .normal)
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        passworField.delegate = self
        usernameField.delegate = self
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        addSubViews()
        view.backgroundColor = .systemBackground
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign Frames
        headerView.frame = CGRect(x: 0, y: 0.0, width: view.width, height: view.heigt / 3.0)
        
        usernameField.frame = CGRect(x: 25, y: headerView.bottom + 40, width: view.width - 50 , height: 52)
        
        passworField.frame = CGRect(x: 25, y: usernameField.bottom + 10, width: view.width - 50, height: 52)
        
        loginButton.frame = CGRect(x: 25, y: passworField.bottom + 10, width: view.width - 50, height: 52)
        
        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom + 10, width: view.width - 50, height: 52)
        
        termsButton.frame = CGRect(x: 10, y: view.heigt - view.safeAreaInsets.bottom - 100, width: view.width - 20, height: 50)
        
        privacyButton.frame = CGRect(x: 10, y: view.heigt - view.safeAreaInsets.bottom - 50, width: view.width - 20, height: 50)
        
        configureHeaderView()
        
    }
    
    func configureHeaderView(){
        guard headerView.subviews.count == 1 else {return}
        
        guard let backgroundView = headerView.subviews.first else {return}
        
        backgroundView.frame = headerView.bounds
        
            // add instagram background
        let imageView = UIImageView(image: UIImage(named: "text"))
        
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width / 4.0, y: view.safeAreaInsets.top, width: view.width / 2.0, height: headerView.heigt - view.safeAreaInsets.top)
    }
    
    private func addSubViews(){
        view.addSubview(usernameField)
        view.addSubview(passworField)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
        view.addSubview(createAccountButton)
        view.addSubview(loginButton)
    }


    @objc func didTapPrivacyButton(){
        guard let url = URL(string: "https://help.instagram.com/155833707900388") else {return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc func didTapTermsButton(){
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc func didTapCreateAccountButton(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
    
    @objc func didTapLoginButton(){
        passworField.resignFirstResponder()
        usernameField.resignFirstResponder()
        
        guard let usernameEmail = usernameField.text, !usernameEmail.isEmpty,
        let password = passworField.text, !password.isEmpty, password.count >= 8 else {return}
    }
    
    //login functionality
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            passworField.becomeFirstResponder()
        }
        else if textField == passworField{
            didTapLoginButton()
        }
        return true
    }
    
}
