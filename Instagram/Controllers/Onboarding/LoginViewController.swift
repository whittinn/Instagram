//
//  LoginViewController.swift
//  Instagram
//
//  Created by Nathaniel Whittington on 8/13/22.
//

import UIKit

class LoginViewController: UIViewController {

    private let usernameField: UITextField = {
       let usernameField = UITextField()
       return usernameField
    }()
    
    private let passworField: UITextField = {
       let passwordField = UITextField()
        passwordField.isSecureTextEntry = true
        return passwordField
       
    }()
    
    private let termsButton: UIButton = {
        let termsButton = UIButton()
        return termsButton
    }()
    
    private let privacyButton: UIButton = {
        let privacyButton = UIButton()
        return privacyButton
    }()
    
    private let createAccountButton: UIButton = {
        let createAccountButton = UIButton()
        return createAccountButton
    }()
    private let headerView: UIView = {
        let headerView = UIView()
        return headerView
    }()
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        addSubViews()
        view.backgroundColor = .systemBackground
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign Frames
        
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
        
    }
    
    @objc func didTapTermsButton(){
        
    }
    
    @objc func didTapCreateAccountButton(){
        
    }
    
    @objc func didTapLoginButton(){
        
    }
}
