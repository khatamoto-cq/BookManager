import UIKit
import Kingfisher

class EditBookViewController: UIViewController, FileAttachable {

    var book: Book!

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            let url = URL(string: book.imageUrl)!
            imageView.kf.setImage(with: ImageResource.init(downloadURL: url))
        }
    }

    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.apply(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                              radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
            nameTextField.text = book.name
        }
    }

    @IBOutlet weak var priceTextField: UITextField! {
        didSet {
            priceTextField.apply(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                               radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
            priceTextField.text = String(book.price)
        }
    }

    @IBOutlet weak var purchaseDateTextField: UITextField! {
        didSet {
            purchaseDateTextField.apply(borderWidth: Const.TextFieldBorderWidth,
                                        borderColor: Const.TextFieldBorderColor,
                                        radius: Const.TextFieldCornerRadius,
                                        masksToBound: Const.TextFieldMasksToBounds)
            purchaseDateTextField.text = DateHelper.transform(date: book.purchaseDate)
        }
    }

    @IBOutlet weak var imageAttachButton: UIButton! {
        didSet {
            imageAttachButton.radius()
        }
    }

    @IBAction func popupDatepicker(_ sender: UITextField) {
        DatePickerHelper.load(self, action: #selector(pickerChanged), sender: sender)
    }

    @IBAction func didAttachButtonTapped(_ sender: Any) {
        FileAttachHelper.load(self)
    }

    @IBAction func didSaveButtonTapped(_ sender: Any) {
        print(R.string.localizable.logRegistBook)
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
        FileAttachHelper.setImage(self, info: info)
    }
}
