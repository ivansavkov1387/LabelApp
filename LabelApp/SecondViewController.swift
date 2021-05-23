//
//  SecondViewController.swift
//  LabelApp
//
//  Created by Иван on 5/23/21.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        tabBarItem = UITabBarItem(title: "Загрузки", image: UIImage(systemName: "downloads"), tag: 1)
    }

}
