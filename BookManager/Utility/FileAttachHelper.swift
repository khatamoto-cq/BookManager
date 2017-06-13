import Foundation
import UIKit

class FileAttachHelper {
    class func load(_ target: UIViewController) {
        let delegate = target as? UIImagePickerControllerDelegate & UINavigationControllerDelegate

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = delegate
            target.present(picker, animated: true)
        }
    }

    class func setImage(_ controller: FileAttachable, info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            controller.imageView.image = image
        }

        (controller as? UIViewController)?.dismiss(animated: true)
    }
}
