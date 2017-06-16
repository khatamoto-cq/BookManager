import UIKit

class NumericHelper {
    static func transformStringToInt(_ numberOfString: String) -> Int {
        let regEx = NSPredicate(format: "SELF MATCHES '\\\\d+'")

        if regEx.evaluate(with: numberOfString) {
            return Int(numberOfString)!
        }

        return 0
    }
}
