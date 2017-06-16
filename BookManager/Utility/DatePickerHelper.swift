import Foundation
import UIKit

class DatePickerHelper {
    static func load(_ target: Any?, action: Selector, sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        sender.inputView = datePicker
        datePicker.addTarget(target, action: action,
                             for: UIControlEvents.valueChanged)
    }

    static func setValue(_ sender: UIDatePicker, target: UITextField) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        target.text = dateFormatter.string(from: sender.date)
    }
}
