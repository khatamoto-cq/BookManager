import Foundation
import UIKit

extension UIAlertController {
    static func showLeftParagraphAlert(title: String, message: String) -> UIAlertController {
        let alertWindow = UIAlertController(title: title,
                                            message: message, preferredStyle: .alert)

        let canselAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertWindow.addAction(canselAction)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left

        let messageText = NSMutableAttributedString(
            string: message,
            attributes: [
                NSParagraphStyleAttributeName: paragraphStyle
            ]
        )

        alertWindow.setValue(messageText, forKey: "attributedMessage")

        return alertWindow
    }
}
