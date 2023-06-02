//
//  HandViewController.swift
//  Navigation
//
//  Created by gleb on 10/05/2023.
//

import UIKit

class HandViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
        showBarButton()
    }

    func showBarButton() {
        let barButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapOnInfo))
        self.navigationItem.rightBarButtonItem = barButton
    }
    @objc
    func tapOnInfo() {
        let infoView = InfoViewController()
        present(infoView, animated: true)
    }
}
