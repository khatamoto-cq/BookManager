import UIKit
import APIKit

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
        guard validate(email: emailTextField.text!, password: passwordTextField.text!) else {
            let alertController = UIAlertController.createLeftParagraphAlert(
                title: R.string.localizable.errorLoginTitle(), message: R.string.localizable.errorLogin())
            return self.present(alertController, animated: true, completion: nil)
        }

        requestLogin()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func validate(email: String, password: String) -> Bool {
        return !email.isEmpty && !password.isEmpty
    }

    func requestLogin() {
        let loginRequest = LoginRequest(email: emailTextField.text!, password: passwordTextField.text!)

        Session.send(loginRequest) { result in
            switch result {
            case .success(let accountResponse):
                print("[ログイン] user_id: \(accountResponse.userId), request_token: \(accountResponse.requestToken)")
                AuthManager.shared.save(accountResponse)

                let controller = R.storyboard.main.tabViewController()
                controller?.modalTransitionStyle = .crossDissolve
                self.present(controller!, animated: true, completion: nil)
            case .failure(let error):
                print("error: \(error)")
                let alertController = UIAlertController.createLeftParagraphAlert(
                    title: R.string.localizable.errorLoginTitle(), message: R.string.localizable.errorLogin())
                return self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
