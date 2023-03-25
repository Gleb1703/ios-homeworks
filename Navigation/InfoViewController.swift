//
//  InfoViewController.swift
//  Navigation
//
//  Created by gleb on 28/12/2022.
//

import UIKit

class InfoViewController: UIViewController {

    private let alertButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Alert!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.frame = CGRect(x: 150, y: 300, width: 100, height: 50)
        return button
    }()

    private let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("✖︎", for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.frame = CGRect(x: 300, y: 30, width: 40, height: 40)
        return button
    }()

    let alertController = UIAlertController(title: "Внимание", message: "Сообщение", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(alertButton)
        view.addSubview(closeButton)
        addTarget()
        alertAction()
    }

    func alertAction() {
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            print("OK")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) {_ in
            print("Cancel")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
    }

    func addTarget() {
        alertButton.addTarget(self, action: #selector(tapOnAlert), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(tapOnExit), for: .touchUpInside)
    }
    @objc
    func tapOnAlert() {
        self.present(alertController, animated: true)
    }
    @objc
    func tapOnExit() {
        self.dismiss(animated: true)
    }
    
}
