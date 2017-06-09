import Foundation
import UIKit

class FileAttachHelper {
    class func load(_ target: UIViewController,
                    delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = delegate
            target.present(picker, animated: true)
        }
    }
}
