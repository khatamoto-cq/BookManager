import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.layer.borderWidth = Const.TextFieldBorderWidth
            emailTextField.layer.cornerRadius = Const.TextFieldCornerRadius
            emailTextField.layer.borderColor = Const.TextFieldBorderColor
            emailTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        }
    }

    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.layer.borderWidth = Const.TextFieldBorderWidth
            passwordTextField.layer.cornerRadius = Const.TextFieldCornerRadius
            passwordTextField.layer.borderColor = Const.TextFieldBorderColor
            passwordTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        }
    }

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = Const.TextFieldCornerRadius
        }
    }

    @IBAction func tapLoginAction(_ sender: Any) {
        if validate() {
            let controller = R.storyboard.main.tabViewController()
            controller?.modalTransitionStyle = .crossDissolve
            return present(controller!, animated: true, completion: nil)
        }

        let alertWindow = UIAlertController(title: "ログインエラー",
                        message: "メールアドレスもしくはパスワードが違います", preferredStyle: .alert)
        let canselAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertWindow.addAction(canselAction)
        present(alertWindow, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func validate() -> Bool {
        if emailTextField.text == "" || passwordTextField.text == "" {
            return false
        }

        // (todo) APIと連携時にID/PWチェック
        return true
    }
}
