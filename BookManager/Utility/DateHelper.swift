import Foundation

class DateHelper {
    class func transform(date: String) -> String {
        let inFmt = DateFormatter()
        inFmt.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        inFmt.timeZone = TimeZone.current
        inFmt.locale = Locale(identifier: "en_US_POSIX")

        let outFmt = DateFormatter()
        outFmt.dateFormat = "yyyy/MM/dd"

        if  let formatedDate = inFmt.date(from: date) {
            return outFmt.string(from: formatedDate)
        }

        print(R.string.localizable.errorDateFormatter())

        return date
    }
}
