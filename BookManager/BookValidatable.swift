import UIKit

protocol BookValidatable {
    func validate(name: String, price: String) -> [String]
}

extension BookValidatable {
    func validate(name: String, price: String) -> [String] {
        var errors: [String] = []
        let predicate = NSPredicate(format: "SELF MATCHES '\\\\d+'")

        if name.isEmpty {
            errors.append(R.string.localizable.validateErrorRequireBookName())
        }

        if price.isEmpty {
            errors.append(R.string.localizable.validateErrorNumericBookPrice())
        } else if !predicate.evaluate(with: price) {
            errors.append(R.string.localizable.validateErrorNumericBookPrice())
        }

        return errors
    }
}
