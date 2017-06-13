import UIKit

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
        print(R.string.localizable.logRegistAccount())

        if !UserDefaults.standard.bool(forKey: "logined") {
            saveLoginState()
            let controller = R.storyboard.main.tabViewController()
            controller?.modalTransitionStyle = .crossDissolve
            present(controller!, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func saveLoginState() {
        UserDefaults.standard.set(true, forKey: "logined")
        UserDefaults.standard.synchronize()
    }
}
