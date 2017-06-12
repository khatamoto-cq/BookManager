import UIKit

class EditBookViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var book: Book!

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
        nameTextField.layer.borderWidth = Const.TextFieldBorderWidth
        nameTextField.layer.cornerRadius = Const.TextFieldCornerRadius
        nameTextField.layer.borderColor = Const.TextFieldBorderColor
        nameTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        nameTextField.text = book.name

        priceTextField.layer.borderWidth = Const.TextFieldBorderWidth
        priceTextField.layer.cornerRadius = Const.TextFieldCornerRadius
        priceTextField.layer.borderColor = Const.TextFieldBorderColor
        priceTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        priceTextField.text = book.price

        purchaseDateTextField.layer.borderWidth = Const.TextFieldBorderWidth
        purchaseDateTextField.layer.cornerRadius = Const.TextFieldCornerRadius
        purchaseDateTextField.layer.borderColor = Const.TextFieldBorderColor
        purchaseDateTextField.layer.masksToBounds = Const.TextFieldMasksToBounds
        purchaseDateTextField.text = book.purchaseDate

        imageAttachButton.layer.cornerRadius = 5
    }
}
