//
//  SettingViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/05.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBAction func clickAccountSetting(_ sender: Any) {
        performSegue(withIdentifier: "setting", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
