//
//  SecondController.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import UIKit

let headerView = ProfileHeaderView()

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        viewWillLayoutSubviews()
        view.backgroundColor = .lightGray
        headerView.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        view.addSubview(headerView)
    }
}
