//
//  InfoViewController.swift
//  Navigation
//
//  Created by gleb on 28/12/2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let myButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        myButton.backgroundColor = .green
        myButton.setTitle("Test Button", for: .normal)
        myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(myButton)
        
    }
    
    let alertController = UIAlertController(title: "C новым годом!", message: "Вам подарок", preferredStyle: .alert)
    
    @objc func buttonAction(sender: UIButton!) {
        
        self.present(alertController, animated: true, completion: nil)
        
        func setupAlertConfiguration() {
            let actionOne = UIAlertAction(title: "Получить", style: .default) {_ in
                print("*Получен macbook*")}
            alertController.addAction(actionOne)
            let actionTwo = UIAlertAction(title: "Отказаться", style: .default) {_ in
                print("sad")}
            alertController.addAction(actionTwo)
            return
        }
        
        setupAlertConfiguration()
        
    }
}
