import UIKit
import APIKit

class AccountViewController: UIViewController {

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

    @IBOutlet weak var passwordConfirmTextField: UITextField! {
        didSet {
            passwordConfirmTextField.apply(borderWidth: Const.TextFieldBorderWidth,
                borderColor: Const.TextFieldBorderColor, radius: Const.TextFieldCornerRadius,
                masksToBound: Const.TextFieldMasksToBounds)
        }
    }

    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            let logined = UserDefaults.standard.bool(forKey: "logined")
            closeButton.isEnabled = logined
            closeButton.isHidden = !logined
        }
    }

    @IBAction func didCloseButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func didSaveButtonTapped(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let passwordConfirm = passwordConfirmTextField.text!

        let errors = validate(email: email, password: password, passwordConfirm: passwordConfirm)
        if !errors.isEmpty {
            return AlertHelper.showAlert(self, title: R.string.localizable.validateErrorTitle(),
                                         message: errors.joined(separator: "\n"))
        }
        saveAccount(email: email, password: password)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func saveLoginState() {
        UserDefaults.standard.set(true, forKey: "logined")
        UserDefaults.standard.synchronize()
    }

    func saveAccount(email: String, password: String) {
        let accountRequest = AccountRequest(email: email, password: password)

        Session.send(accountRequest) { result in
            switch result {
            case .success(let auth):
                print("[アカウント追加完了] user_id: \(auth.userId), request_token: \(auth.requestToken)")
                AuthManager.shared.save(auth)

                if !UserDefaults.standard.bool(forKey: "logined") {
                    self.saveLoginState()
                    let controller = R.storyboard.main.tabViewController()
                    controller?.modalTransitionStyle = .crossDissolve
                    return self.present(controller!, animated: true, completion: nil)
                }

                self.dismiss(animated: true, completion: nil)
            case .failure(let error):
                print("error: \(error)")
                AlertHelper.showAlert(self, title: R.string.localizable.validateErrorTitle(),
                                      message: R.string.localizable.errorNetworing())
            }
        }
    }

    func validate(email: String, password: String, passwordConfirm: String) -> [String] {
        var errors: [String] = []

        if email.isEmpty {
            errors.append(R.string.localizable.validateErrorRequireAccountEmail())
        } else {
            let regEx = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
            if !regEx.evaluate(with: email) {
                errors.append(R.string.localizable.validateErrorInvalidEmail())
            }
        }

        if password.isEmpty {
            errors.append(R.string.localizable.validateErrorRequireAccountPassword())
        }

        if passwordConfirm.isEmpty {
            errors.append(R.string.localizable.validateErrorRequireAccountPasswordConfirm())
        }

        if !password.isEmpty && !passwordConfirm.isEmpty {
            if password != passwordConfirm {
                errors.append(R.string.localizable.validateErrorCompareAccountPassword())
            }
        }

        return errors
    }
}
