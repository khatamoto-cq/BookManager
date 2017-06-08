//
//  SettingViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/05.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var settingButton: UIButton!

    @IBAction func tapSettingAction(_ sender: Any) {
        performSegue(withIdentifier: "setting", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        settingButton.layer.cornerRadius = 5
    }
}
