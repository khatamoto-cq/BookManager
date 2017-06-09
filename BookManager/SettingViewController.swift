import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var settingButton: UIButton!

    @IBAction func tapSettingAction(_ sender: Any) {
        performSegue(withIdentifier: "setting", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        settingButton.layer.cornerRadius = 5
    }
}
