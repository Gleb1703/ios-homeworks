//
//  PostViewController.swift
//  Navigation
//
//  Created by gleb on 28/12/2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        self.navigationItem.title = titlePost
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem = myButton
    }
    var titlePost = "Мой пост"
    @objc func tap() {
        let infoViewController = InfoViewController()
      navigationController?.pushViewController(infoViewController, animated: true)
    }
}
