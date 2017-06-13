import UIKit

class AddBookViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.layer.borderWidth = Const.TextFieldBorderWidth
            nameTextField.layer.cornerRadius = Const.TextFieldCornerRadius
            nameTextField.layer.borderColor = Const.TextFieldBorderColor
            nameTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        }
    }

    @IBOutlet weak var priceTextField: UITextField! {
        didSet {
            priceTextField.layer.borderWidth = Const.TextFieldBorderWidth
            priceTextField.layer.cornerRadius = Const.TextFieldCornerRadius
            priceTextField.layer.borderColor = Const.TextFieldBorderColor
            priceTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        }
    }

    @IBOutlet weak var purchaseDateTextField: UITextField! {
        didSet {
            purchaseDateTextField.layer.borderWidth = Const.TextFieldBorderWidth
            purchaseDateTextField.layer.cornerRadius = Const.TextFieldCornerRadius
            purchaseDateTextField.layer.borderColor = Const.TextFieldBorderColor
            purchaseDateTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        }
    }

    @IBOutlet weak var imageAttachButton: UIButton! {
        didSet {
            imageAttachButton.layer.cornerRadius = Const.TextFieldCornerRadius
        }
    }

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func popupDatepickerAction(_ sender: UITextField) {
        DatePickerHelper.load(self, action: #selector(pickerChanged), sender: sender)
    }

    @IBAction func attachImageAction(_ sender: Any) {
        FileAttachHelper.load(self, delegate: self)
    }

    @IBAction func saveAction(_ sender: Any) {
        print("登録しました")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
}
