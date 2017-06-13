import UIKit

class AccountViewController: UIViewController {

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

    @IBOutlet weak var passwordConfirmTextField: UITextField! {
        didSet {
            passwordConfirmTextField.layer.borderWidth = Const.TextFieldBorderWidth
            passwordConfirmTextField.layer.cornerRadius = Const.TextFieldCornerRadius
            passwordConfirmTextField.layer.borderColor = Const.TextFieldBorderColor
            passwordConfirmTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        }
    }

    @IBOutlet weak var closeButton: UIButton!

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveAction(_ sender: Any) {
        print("アカウント設定を登録しました")

        if !UserDefaults.standard.bool(forKey: "logined") {
            saveLoginState()
            let controller = R.storyboard.main.tabViewController()
            controller?.modalTransitionStyle = .crossDissolve
            present(controller!, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let logined = UserDefaults.standard.bool(forKey: "logined")
        closeButton.isEnabled = logined
        closeButton.isHidden = !logined
    }

    func saveLoginState() {
        UserDefaults.standard.set(true, forKey: "logined")
        UserDefaults.standard.synchronize()
    }
}
