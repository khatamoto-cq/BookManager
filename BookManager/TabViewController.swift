//
//  TabViewController.swift
//  BookManager
//
//  Created by hatamoto kanji on 2017/06/08.
//  Copyright © 2017年 hatamoto kanji. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Tabを押したら中のViewControllerを指定する処理を調査中
    }
}
