//
//  EditBookViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/06.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class EditBookViewController: UIViewController {

    var datePicker: UIDatePicker!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var purchaseDateTextField: UITextField!

    @IBAction func popupDatepicker(_ sender: UITextField) {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(pickerChanged),
                             for: UIControlEvents.valueChanged)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func pickerChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        purchaseDateTextField.text = dateFormatter.string(from: sender.date)
    }
}
