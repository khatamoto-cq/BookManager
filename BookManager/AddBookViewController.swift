//
//  AddBookViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/06.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var purchaseDateTextField: UITextField!
    @IBOutlet weak var imageAttachButton: UIButton!

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func popupDatepickerAction(_ sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(pickerChanged),
                             for: UIControlEvents.valueChanged)
    }

    @IBAction func attachImageAction(_ sender: Any) {
        let photo = UIImagePickerControllerSourceType.photoLibrary

        if UIImagePickerController.isSourceTypeAvailable(photo) {
            let picker = UIImagePickerController()
            picker.sourceType = photo
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }

    @IBAction func saveAction(_ sender: Any) {
        print("登録しました")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initControls()
    }

    override func didReceiveMemoryWarning() {
    }

    func pickerChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        purchaseDateTextField.text = dateFormatter.string(from: sender.date)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }

        self.dismiss(animated: true)
    }

    func initControls() {
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.masksToBounds = true

        priceTextField.layer.borderWidth = 1
        priceTextField.layer.cornerRadius = 5
        priceTextField.layer.borderColor = UIColor.lightGray.cgColor
        priceTextField.layer.masksToBounds = true

        purchaseDateTextField.layer.borderWidth = 1
        purchaseDateTextField.layer.cornerRadius = 5
        purchaseDateTextField.layer.borderColor = UIColor.lightGray.cgColor
        purchaseDateTextField.layer.masksToBounds = true

        imageAttachButton.layer.cornerRadius = 5
    }
}
