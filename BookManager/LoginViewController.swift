import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.apply(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                               radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
        }
    }

    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.apply(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                                  radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
        }
    }

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.radius()
        }
    }

    @IBAction func didLoginButtonTapped(_ sender: Any) {
        guard validate() else {
            let alertWindow = UIAlertController(title: R.string.localizable.loginErrorTitle(),
                    message: R.string.localizable.loginErrorMessage(), preferredStyle: .alert)
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
        if (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            return false
        }

        // (todo) APIと連携時にID/PWチェック
        return true
    }
}
