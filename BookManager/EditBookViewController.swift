import UIKit

class EditBookViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var purchaseDateTextField: UITextField!
    @IBOutlet weak var imageAttachButton: UIButton!

    @IBAction func popupDatepickerAction(_ sender: UITextField) {
        DatePickerHelper.load(self, action: #selector(pickerChanged), sender: sender)
    }

    @IBAction func attachImageAction(_ sender: Any) {
        FileAttachHelper.load(self, delegate: self)
    }

    @IBAction func saveAction(_ sender: Any) {
        print("書籍を編集しました。") // (todo) APIにて登録
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initControls()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func pickerChanged(sender: UIDatePicker) {
        DatePickerHelper.setValue(sender, target: self.purchaseDateTextField)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        FileAttachHelper.setImage(self, imageView: self.imageView, info: info)
    }

    func initControls() {
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.masksToBounds = true

        priceTextField.layer.borderWidth = 1
        priceTextField.layer.cornerRadius = 5
        priceTextField.layer.borderColor = UIColor.lightGray.cgColor
        priceTextField.layer.masksToBounds = true

        purchaseDateTextField.layer.borderWidth = 1
        purchaseDateTextField.layer.cornerRadius = 5
        purchaseDateTextField.layer.borderColor = UIColor.lightGray.cgColor
        purchaseDateTextField.layer.masksToBounds = true

        imageAttachButton.layer.cornerRadius = 5
    }
}
