import UIKit
import APIKit

class AddBookViewController: UIViewController, FileAttachable, BookValidateable {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.apply(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                              radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
        }
    }

    @IBOutlet weak var priceTextField: UITextField! {
        didSet {
            priceTextField.apply(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                               radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
        }
    }

    @IBOutlet weak var purchaseDateTextField: UITextField! {
        didSet {
            purchaseDateTextField.apply(borderWidth: Const.TextFieldBorderWidth,
                                        borderColor: Const.TextFieldBorderColor,
                                        radius: Const.TextFieldCornerRadius,
                                        masksToBound: Const.TextFieldMasksToBounds)
        }
    }

    @IBOutlet weak var imageAttachButton: UIButton! {
        didSet {
            imageAttachButton.radius()
        }
    }

    @IBAction func didCloseButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func popupDatepicker(_ sender: UITextField) {
        DatePickerHelper.load(self, action: #selector(pickerChanged), sender: sender)
    }

    @IBAction func didAttachButtonTapped(_ sender: Any) {
        FileAttachHelper.load(self)
    }

    @IBAction func didSaveButtonTapped(_ sender: Any) {
        let errors = validate(name: nameTextField.text!, price: priceTextField.text!)

        guard !errors.isEmpty else {
            return AlertHelper.showAlert(self, title: R.string.localizable.validateErrorTitle(),
                                         message: errors.joined(separator: "\n"))
        }

        let auth = AuthManager.shared.getAuth()
        if auth.requestToken.isEmpty || auth.userId == 0 {
            return AlertHelper.showAlert(self, title: R.string.localizable.errorTitle(),
                                         message: R.string.localizable.errorAuthentication())
        }

        let addBookRequest = AddBookRequest(name: nameTextField.text!,
                                            price: NumericHelper.transformStringToInt(priceTextField.text!),
                                            purchaseDate: purchaseDateTextField.text!,
                                            image: ImageHelper.encode(image: imageView.image)!,
                                            userId: auth.userId, token: auth.requestToken)

        Session.send(addBookRequest) { result in
            switch result {
            case .success(let bookResult):
                print("[書籍追加完了] 書籍ID: \(bookResult.bookId)")
                self.dismiss(animated: true, completion: nil)
            case .failure(let error):
                print("error: \(error)")
                AlertHelper.showAlert(self, title: R.string.localizable.validateErrorTitle(),
                                    message: R.string.localizable.errorNetworing())
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func pickerChanged(sender: UIDatePicker) {
        DatePickerHelper.setValue(sender, target: purchaseDateTextField)
    }
}

extension AddBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        FileAttachHelper.setImage(self, info: info)
    }
}
