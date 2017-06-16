import UIKit
import Kingfisher
import APIKit

class EditBookViewController: UIViewController, FileAttachable, BookValidatable {

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
            if book.purchaseDate != nil {
                purchaseDateTextField.text = Date.transformFromApiDateToClientDate(date: book.purchaseDate!)
            }
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

        guard errors.isEmpty else {
            let alertController = UIAlertController.createLeftParagraphAlert(
                title: R.string.localizable.validateErrorTitle(), message: errors.joined(separator: "\n"))
            return self.present(alertController, animated: true, completion: nil)
        }

        let auth = AuthManager.shared.getAuth()
        if auth.requestToken.isEmpty || auth.userId == 0 {
            let alertController = UIAlertController.createLeftParagraphAlert(
                title: R.string.localizable.errorTitle(), message: R.string.localizable.errorAuthentication())
            return self.present(alertController, animated: true, completion: nil)
        }

        book.name = nameTextField.text!
        book.price = Int(priceTextField.text!)!
        book.purchaseDate = purchaseDateTextField.text!

        editBook(book: book, imageData: ImageHelper.encode(image: imageView.image!)!, auth: auth)
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

    func editBook(book: Book, imageData: String, auth: Auth) {
        let editBookRequest = EditBookRequest(id: book.id, name: book.name, price: book.price,
                                              purchaseDate: book.purchaseDate!,
                                              imageData: imageData,
                                              token: auth.requestToken)

        Session.send(editBookRequest) { result in
            switch result {
            case .success(let bookResult):
                print("[書籍編集完了] 書籍ID: \(bookResult.bookId)")
                self.navigationController?.popViewController(animated: true)
            case .failure(let error):
                print("error: \(error)")
                let alertController = UIAlertController.createLeftParagraphAlert(
                    title: R.string.localizable.validateErrorTitle(), message: R.string.localizable.errorNetworing())
                return self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

extension EditBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        FileAttachHelper.setImage(self, info: info)
    }
}
