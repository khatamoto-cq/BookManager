import UIKit
import Kingfisher
import APIKit

class EditBookViewController: BaseBookViewController, FileAttachable {

    var book: Book!

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            if !book.imageUrl.isEmpty {
                imageView.kf.setImage(with: ImageResource.init(downloadURL: URL(string: book.imageUrl)!))
            }
        }
    }

    @IBOutlet override weak var nameTextField: UITextField! {
        didSet {
            nameTextField.apply(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                              radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
            nameTextField.text = book.name
        }
    }

    @IBOutlet override weak var priceTextField: UITextField! {
        didSet {
            priceTextField.apply(borderWidth: Const.TextFieldBorderWidth, borderColor: Const.TextFieldBorderColor,
                               radius: Const.TextFieldCornerRadius, masksToBound: Const.TextFieldMasksToBounds)
            priceTextField.text = String(book.price)
        }
    }

    @IBOutlet override weak var purchaseDateTextField: UITextField! {
        didSet {
            purchaseDateTextField.apply(borderWidth: Const.TextFieldBorderWidth,
                                        borderColor: Const.TextFieldBorderColor,
                                        radius: Const.TextFieldCornerRadius,
                                        masksToBound: Const.TextFieldMasksToBounds)
            purchaseDateTextField.text = DateHelper.transform(date: book.purchaseDate!)
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
        let errors = validate()
        if errors.count > 0 {
            return AlertHelper.showAlert(self, title: R.string.localizable.validateErrorTitle(),
                                         message: errors.joined(separator: "\n"))
        }

        let token = UserDefaults.standard.string(forKey: "request_token")
        let userId = UserDefaults.standard.integer(forKey: "user_id")
        if token == nil || userId == 0 {
            return AlertHelper.showAlert(self, title: R.string.localizable.errorTitle(),
                                         message: R.string.localizable.errorAuthentication())
        }

        book.name = nameTextField.text!
        book.price = Int(priceTextField.text!)!
        book.purchaseDate = purchaseDateTextField.text!

        let editBookRequest = EditBookRequest(id: book.id, name: book.name, price: book.price,
                                             purchaseDate: book.purchaseDate!,
                                             image: ImageHelper.encode(image: imageView.image!)!,
                                             token: token!)

        Session.send(editBookRequest) { result in
            switch result {
            case .success(let bookResult):
                print("[書籍編集完了] 書籍ID: \(bookResult.bookId)")
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
}

extension EditBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        FileAttachHelper.setImage(self, info: info)
    }
}
