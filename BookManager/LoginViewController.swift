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
        guard validate() else {
            let alertController = UIAlertController.showLeftParagraphAlert(
                title: R.string.localizable.errorLoginTitle(), message: R.string.localizable.errorLogin())
            return self.present(alertController, animated: true, completion: nil)
        }

        requestLogin()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func validate() -> Bool {
        if (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            return false
        }

        return true
    }

    func requestLogin() {
        let loginRequest = LoginRequest(email: emailTextField.text!, password: passwordTextField.text!)

        Session.send(loginRequest) { result in
            switch result {
            case .success(let auth):
                print("[ログイン] user_id: \(auth.userId), request_token: \(auth.requestToken)")
                AuthManager.shared.save(auth)

                let controller = R.storyboard.main.tabViewController()
                controller?.modalTransitionStyle = .crossDissolve
                self.present(controller!, animated: true, completion: nil)
            case .failure(let error):
                print("error: \(error)")
                let alertController = UIAlertController.showLeftParagraphAlert(
                    title: R.string.localizable.errorLoginTitle(), message: R.string.localizable.errorLogin())
                return self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
