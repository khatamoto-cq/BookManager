import Foundation

class DateHelper {
    class func transform(date: String) -> String {
        let inFmt = DateFormatter()
        inFmt.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        let outFmt = DateFormatter()
        outFmt.dateFormat = "yyyy/MM/dd"

        if  let formatedDate = inFmt.date(from: date) {
            return outFmt.string(from: formatedDate)
        }

        print("日付のフォーマット変換に失敗しました")
        return date
    }
}
