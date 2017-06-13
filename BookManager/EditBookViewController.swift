import UIKit

class EditBookViewController: UIViewController {

    var book: Book!

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.ext(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                              radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
            nameTextField.text = book.name
        }
    }

    @IBOutlet weak var priceTextField: UITextField! {
        didSet {
            priceTextField.ext(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                               radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
            priceTextField.text = book.price
        }
    }

    @IBOutlet weak var purchaseDateTextField: UITextField! {
        didSet {
            purchaseDateTextField.ext(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                                      radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
            purchaseDateTextField.text = book.purchaseDate
        }
    }

    @IBOutlet weak var imageAttachButton: UIButton! {
        didSet {
            imageAttachButton.radius()
        }
    }

    @IBAction func popupDatepickerAction(_ sender: UITextField) {
        DatePickerHelper.load(self, action: #selector(pickerChanged), sender: sender)
    }

    @IBAction func attachImageAction(_ sender: Any) {
        FileAttachHelper.load(self)
    }

    @IBAction func saveAction(_ sender: Any) {
        print("書籍を編集しました。") // (todo) APIにて登録
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
}

extension EditBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        FileAttachHelper.setImage(self, imageView: self.imageView, info: info)
    }
}
