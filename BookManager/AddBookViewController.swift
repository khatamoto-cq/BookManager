//
//  AddBookViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/06.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    var datePicker: UIDatePicker!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var purchaseDateTextField: UITextField!

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func popupDatepicker(_ sender: UITextField) {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(pickerChanged),
                             for: UIControlEvents.valueChanged)
    }

    @IBAction func saveAction(_ sender: Any) {
        print("登録しました")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
    }

    func pickerChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        purchaseDateTextField.text = dateFormatter.string(from: sender.date)
    }
}
