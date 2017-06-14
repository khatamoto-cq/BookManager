import UIKit

class BaseBookViewController: UIViewController {

    weak var nameTextField: UITextField!
    weak var priceTextField: UITextField!
    weak var purchaseDateTextField: UITextField!

    func validate() -> [String] {
        var errors: [String] = []
        let predicate = NSPredicate(format: "SELF MATCHES '\\\\d+'")

        if (nameTextField.text?.isEmpty)! {
            errors.append(R.string.localizable.validateErrorRequireBookName())
        }

        if (priceTextField.text?.isEmpty)! {
            errors.append(R.string.localizable.validateErrorNumericBookPrice())
        } else if !predicate.evaluate(with: priceTextField.text) {
            errors.append(R.string.localizable.validateErrorNumericBookPrice())
        }

        return errors
    }

    func pickerChanged(sender: UIDatePicker) {
        DatePickerHelper.setValue(sender, target: purchaseDateTextField)
    }
}
