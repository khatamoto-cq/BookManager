import Foundation
import UIKit

class ImageHelper {
    class func encode(image: UIImage) -> String? {
        let data = NSData(data: UIImagePNGRepresentation(image)!)
        let encodeString =
            data.base64EncodedString(options: [])
        return encodeString
    }
}
