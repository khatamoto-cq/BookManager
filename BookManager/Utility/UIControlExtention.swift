import Foundation
import UIKit

extension UITextField {
    func ext(borderWidth: CGFloat, borderColor: CGColor, radius: CGFloat, masksToBound: Bool) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = masksToBound
    }
}

extension UIButton {
    func radius() {
        self.layer.cornerRadius = Const.ButtonCornerRadius
    }
}
