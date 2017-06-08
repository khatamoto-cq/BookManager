//
//  LoginViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/05.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    @IBAction func tapLoginAction(_ sender: Any) {
        if validate() {
            var controller: TabViewController!
            controller = self.storyboard?.instantiateViewController(
                withIdentifier: "TabViewController") as? TabViewController
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
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
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.masksToBounds = true

        // パスワード(テキストフィールド)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.masksToBounds = true

        // ログイン(ボタン)
        loginButton.layer.cornerRadius = 5
    }

    func validate() -> Bool {
        if emailTextField.text == "" || passwordTextField.text == "" {
            return false
        }

        // (todo) APIと連携時にID/PWチェック
        return true
    }
}
