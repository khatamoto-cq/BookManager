import Foundation
import UIKit

class ImageHelper {
    static func encode(image: UIImage?) -> String? {
        if image == nil {
            return ""
        }

        let data = NSData(data: UIImagePNGRepresentation(image!)!)
        let encodeString =
            data.base64EncodedString(options: [])

        return encodeString
    }
}
