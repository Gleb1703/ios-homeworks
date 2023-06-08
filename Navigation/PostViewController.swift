//
//  PostViewController.swift
//  Navigation
//
//  Created by gleb on 28/12/2022.
//

import UIKit

class PostViewController: UIViewController{
    
    var titlePost: String = "My post"
    
    override func viewDidLoad() {

            super.viewDidLoad()

            self.view.backgroundColor = .white
        
        self.navigationItem.title = titlePost
        
        configureItems()
       
        
    }
    private func configureItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.buttonAction))
        
    }
    @objc func buttonAction(){
        let vc = InfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

