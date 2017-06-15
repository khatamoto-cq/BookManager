import Foundation

class DateHelper {
    class func transformFromApiDateToClientDate(date: String) -> String {
        let fromFmt = DateFormatter()
        fromFmt.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        fromFmt.timeZone = TimeZone.current
        fromFmt.locale = Locale(identifier: "en_US_POSIX")

        let toFmt = DateFormatter()
        toFmt.dateFormat = "yyyy/MM/dd"

        if  let formatedDate = fromFmt.date(from: date) {
            return toFmt.string(from: formatedDate)
        }

        print(R.string.localizable.errorDateFormatter())

        return date
    }
}
