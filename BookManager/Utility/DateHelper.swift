import Foundation

class DateHelper {
    static func transformFromApiDateToClientDate(date: String) -> String {
        let fromFmt = DateFormatter()
        fromFmt.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        fromFmt.timeZone = TimeZone.current
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            fromFmt.locale = Locale(identifier: countryCode)
        }

        let toFmt = DateFormatter()
        toFmt.dateFormat = "yyyy/MM/dd"

        if  let formatedDate = fromFmt.date(from: date) {
            return toFmt.string(from: formatedDate)
        }

        print(R.string.localizable.errorDateFormatter())

        return date
    }
}
