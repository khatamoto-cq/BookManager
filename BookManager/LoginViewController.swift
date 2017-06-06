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
        if validate() {
            performSegue(withIdentifier: "listBooks", sender: self)
        } else {
            let alertWindow = UIAlertController(title: "ログインエラー",
                                                message: "メールアドレスもしくはパスワードが違います", preferredStyle: .alert)
            let canselAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertWindow.addAction(canselAction)
            present(alertWindow, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initControls()
    }

    func initControls() {
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

    func validate() -> Bool {
        if mailField.text == "" || passwordField.text == "" {
            return false
        }

        return true
    }
}
