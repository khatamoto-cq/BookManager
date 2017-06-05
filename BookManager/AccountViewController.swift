//
//  AccountViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/05.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initControls()
    }

    func initControls() {
        // メール(テキストフィールド)
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.masksToBounds = true

        // パスワード(テキストフィールド)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.masksToBounds = true
        
        // パスワード(テキストフィールド)
        passwordConfirmTextField.layer.borderWidth = 1
        passwordConfirmTextField.layer.cornerRadius = 5
        passwordConfirmTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordConfirmTextField.layer.masksToBounds = true
    }
}
