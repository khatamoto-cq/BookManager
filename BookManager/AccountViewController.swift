import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var closeButton: UIButton!

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveAction(_ sender: Any) {
        print("アカウント設定を登録しました")

        if UserDefaults.standard.bool(forKey: "logined") == false {
            saveLoginState()
            let controller = R.storyboard.main.tabViewController()
            controller?.modalTransitionStyle = .crossDissolve
            present(controller!, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initControls()

        let logined = UserDefaults.standard.bool(forKey: "logined")
        closeButton.isEnabled = logined
        closeButton.isHidden = !logined
    }

    func initControls() {
        // メール(テキストフィールド)
        emailTextField.layer.borderWidth = Const.TextFieldBorderWidth
        emailTextField.layer.cornerRadius = Const.TextFieldCornerRadius
        emailTextField.layer.borderColor = Const.TextFieldBorderColor
        emailTextField.layer.masksToBounds = Const.TextFieldMasksToBounds

        // パスワード(テキストフィールド)
        passwordTextField.layer.borderWidth = Const.TextFieldBorderWidth
        passwordTextField.layer.cornerRadius = Const.TextFieldCornerRadius
        passwordTextField.layer.borderColor = Const.TextFieldBorderColor
        passwordTextField.layer.masksToBounds = Const.TextFieldMasksToBounds

        // パスワード(テキストフィールド)
        passwordConfirmTextField.layer.borderWidth = Const.TextFieldBorderWidth
        passwordConfirmTextField.layer.cornerRadius = Const.TextFieldCornerRadius
        passwordConfirmTextField.layer.borderColor = Const.TextFieldBorderColor
        passwordConfirmTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
    }

    func saveLoginState() {
        UserDefaults.standard.set(true, forKey: "logined")
        UserDefaults.standard.synchronize()
    }
}
