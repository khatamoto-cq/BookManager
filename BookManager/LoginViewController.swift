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
            return AlertHelper.showAlert(self, title: R.string.localizable.loginErrorTitle(),
                                  message: R.string.localizable.loginErrorMessage())
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
                self.saveAuthInfo(auth)
                self.moveListViewController()
            case .failure(let error):
                print("error: \(error)")
                AlertHelper.showAlert(self, title: R.string.localizable.loginErrorTitle(),
                                      message: R.string.localizable.loginErrorMessage())
            }
        }
    }

    func saveAuthInfo(_ auth: Auth) {
        UserDefaults.standard.set(auth.requestToken, forKey: "request_token")
        UserDefaults.standard.set(auth.userId, forKey: "login_id")
        UserDefaults.standard.synchronize()
    }

    func moveListViewController() {
        let controller = R.storyboard.main.tabViewController()
        controller?.modalTransitionStyle = .crossDissolve
        present(controller!, animated: true, completion: nil)
    }
}
