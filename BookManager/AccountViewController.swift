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

        if UserDefaults.standard.bool(forKey: "logined") {
            closeButton.isEnabled = true
            closeButton.isHidden = false
        } else {
            closeButton.isEnabled = false
            closeButton.isHidden = true
        }
    }

    func initControls() {
        // メール(テキストフィールド)
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.masksToBounds = true

        // パスワード(テキストフィールド)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.masksToBounds = true

        // パスワード(テキストフィールド)
        passwordConfirmTextField.layer.borderWidth = 1
        passwordConfirmTextField.layer.cornerRadius = 5
        passwordConfirmTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordConfirmTextField.layer.masksToBounds = true
    }

    func saveLoginState() {
        UserDefaults.standard.set(true, forKey: "logined")
        UserDefaults.standard.synchronize()
    }
}
