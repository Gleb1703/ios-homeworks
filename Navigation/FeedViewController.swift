//
//  FeedViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 16.07.2022.
//

import UIKit

class FeedViewController: UIViewController{
    
    var post = "Мой пост"
    
    override func viewDidLoad() {

            super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.button)
        self.button.center = self.view.center
        self.navigationItem.title = "Feed"
       

    }
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Перейти на пост", for: .normal)
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()

    
    @objc private func didTapButton() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post
    }
}
