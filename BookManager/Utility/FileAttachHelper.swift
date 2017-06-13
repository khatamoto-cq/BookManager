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

    class func setImage(_ controller: UIViewController, imageView: UIImageView, info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }

        controller.dismiss(animated: true)
    }
}