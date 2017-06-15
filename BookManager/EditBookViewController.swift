import UIKit
import Kingfisher
import APIKit

class EditBookViewController: UIViewController, FileAttachable, BookValidateable {

    var book: Book!

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            if !book.imageUrl.isEmpty {
                imageView.kf.setImage(with: ImageResource.init(downloadURL: URL(string: book.imageUrl)!))
            }
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
            purchaseDateTextField.text = DateHelper.transformFromApiDateToClientDate(date: book.purchaseDate!)
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
        let errors = validate(name: nameTextField.text!, price: priceTextField.text!)
        if errors.count > 0 {
            return AlertHelper.showAlert(self, title: R.string.localizable.validateErrorTitle(),
                                         message: errors.joined(separator: "\n"))
        }

        let auth = AuthManager.shared.getAuth()
        if auth.requestToken.isEmpty || auth.userId == 0 {
            return AlertHelper.showAlert(self, title: R.string.localizable.errorTitle(),
                                         message: R.string.localizable.errorAuthentication())
        }

        book.name = nameTextField.text!
        book.price = Int(priceTextField.text!)!
        book.purchaseDate = purchaseDateTextField.text!

        let editBookRequest = EditBookRequest(id: book.id, name: book.name, price: book.price,
                                             purchaseDate: book.purchaseDate!,
                                             image: ImageHelper.encode(image: imageView.image!)!,
                                             token: auth.requestToken)

        Session.send(editBookRequest) { result in
            switch result {
            case .success(let bookResult):
                print("[書籍編集完了] 書籍ID: \(bookResult.bookId)")
                self.navigationController?.popViewController(animated: true)
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

extension EditBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        FileAttachHelper.setImage(self, info: info)
    }
}
