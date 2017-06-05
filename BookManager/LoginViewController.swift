//
//  LoginViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/05.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func clickLogin(_ sender: Any) {
        performSegue(withIdentifier: "listBooks", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // メール(テキストフィールド)
        mailField.layer.borderWidth = 1
        mailField.layer.cornerRadius = 5
        mailField.layer.borderColor = UIColor.lightGray.cgColor
        mailField.layer.masksToBounds = true
        
        // パスワード(テキストフィールド)
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 5
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.layer.masksToBounds = true
        
        // ログイン(ボタン)
        loginButton.layer.cornerRadius = 5
    }
    
}
