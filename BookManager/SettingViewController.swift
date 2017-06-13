import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var settingButton: UIButton! {
        didSet {
            settingButton.layer.cornerRadius = 5
        }
    }

    @IBAction func tapSettingAction(_ sender: Any) {
        present(R.storyboard.main.accountNav()!, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
