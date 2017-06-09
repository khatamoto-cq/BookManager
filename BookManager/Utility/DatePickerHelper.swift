import Foundation
import UIKit

class DatePickerHelper {
    class func load(_ target: Any?, action: Selector, sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePicker
        datePicker.addTarget(target, action: action,
                             for: UIControlEvents.valueChanged)
    }
}
