//
//  ViewController.swift
//  Instagram
//
//  Created by Nathaniel Whittington on 8/13/22.
//

import UIKit
import FirebaseAuth
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthOfUser()
    }

    func checkAuthOfUser(){
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true)
        }
        
    }

}

