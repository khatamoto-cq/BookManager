import Foundation
import UIKit

class AlertHelper {

    class func showAlert(_ controller: UIViewController, title: String, message: String) {
        let alertWindow = UIAlertController(title: title,
                                            message: message, preferredStyle: .alert)

        let canselAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertWindow.addAction(canselAction)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left

        let messageText = NSMutableAttributedString(
            string: message,
            attributes: [
                NSParagraphStyleAttributeName: paragraphStyle
            ]
        )
        alertWindow.setValue(messageText, forKey: "attributedMessage")

        controller.present(alertWindow, animated: true, completion: nil)
    }
}
