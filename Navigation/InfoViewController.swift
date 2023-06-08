//
//  InfoViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 18.07.2022.
//

import UIKit

class InfoViewController: UIViewController{
    
override func viewDidLoad() {

          super.viewDidLoad()
    self.navigationItem.title = "Инфо"
    self.view.backgroundColor = .white
    self.openButton.center = self.view.center
    self.view.addSubview(self.openButton)
}
    private lazy var openButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle("Открыть", for: .normal)
        button.addTarget(self, action: #selector(self.didTapOpenButton), for: .touchUpInside)
        return button
    }()
    @objc private func didTapOpenButton() {
        
        let alertController = UIAlertController(title: "Ошибка", message: "Что то пошло не так", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Продолжить", style: .default) { _ in
            print("Привет")
        }
        let secondAction = UIAlertAction(title: "Отмена", style: .destructive) { _ in
            print("Пока")
        }
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true)
    }
}

