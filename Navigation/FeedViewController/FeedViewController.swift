//
//  FirstController.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "пост")
    
    
        private let showDetailButton : UIButton = {
            let button = UIButton()
            button.setTitle("Показать детали", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            return button
        }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemPink
            view.addSubview(showDetailButton)
            showDetailButton.frame = CGRect(x: 100, y: 400, width: 100, height: 50)
            showDetailButton.setTitle(post.title, for: .normal)
            addTarget()
        }
        
        func addTarget() {
            showDetailButton.addTarget(self, action: #selector(tabOnButton), for: .touchUpInside)
        }
        
        @objc
        func tabOnButton() {
            let postViewController = PostViewController()
            postViewController.titlePost = post.title
          navigationController?.pushViewController(postViewController, animated: true)
        }
}
    
