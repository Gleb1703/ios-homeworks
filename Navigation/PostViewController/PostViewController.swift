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
    }
    var titlePost = "Мой пост"
}
