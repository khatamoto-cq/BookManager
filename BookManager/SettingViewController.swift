import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var settingButton: UIButton!

    @IBAction func tapSettingAction(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "AccountNav")
        present(controller!, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        settingButton.layer.cornerRadius = 5
    }
}
