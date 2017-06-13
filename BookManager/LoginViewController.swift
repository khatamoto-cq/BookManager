import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.ext(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                               radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
        }
    }

    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.ext(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                                  radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
        }
    }

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.radius()
        }
    }

    @IBAction func tapLoginAction(_ sender: Any) {
        guard validate() else {
            let alertWindow = UIAlertController(title: "ログインエラー",
                                                message: "メールアドレスもしくはパスワードが違います", preferredStyle: .alert)
            let canselAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertWindow.addAction(canselAction)
            return present(alertWindow, animated: true, completion: nil)
        }

        let controller = R.storyboard.main.tabViewController()
        controller?.modalTransitionStyle = .crossDissolve
        return present(controller!, animated: true, completion: nil)
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
