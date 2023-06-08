//
//  FeedViewController.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {
    var post = "Мой пост"
    
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()
    
    private lazy var myPostButton = CustomButton(customTitle: post) {
        self.postTap()
    }
    
    
    private var checkTextFild: UITextField = {
        let textFild = UITextField()
        textFild.layer.borderColor = UIColor.black.cgColor
        textFild.layer.borderWidth = 1
        textFild.translatesAutoresizingMaskIntoConstraints = false
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.layer.cornerRadius = 12
        textFild.leftViewMode = .always
        return textFild
    }()
    
    private var checkLabel: UILabel = {
        let label = UILabel()
        label.text = "Загрузка..."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var checkButton = CustomButton(customTitle: "Проверка") {
        guard let checkedSecret = self.checkTextFild.text else { return }
        
        if !checkedSecret.isEmpty {
            if FeedModel().check(word: checkedSecret) {
                self.checkLabel.text = "Верно"
                self.checkLabel.textColor = .green
            } else {
                self.checkLabel.textColor = .red
                self.checkLabel.text = "Неверно"
            }
        } else {
            print("❌")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func postTap() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post
       
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(myPostButton)
        stackView.addArrangedSubview(checkTextFild)
        stackView.addArrangedSubview(checkLabel)
        stackView.addArrangedSubview(checkButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            checkTextFild.widthAnchor.constraint(equalToConstant: 300),
            checkTextFild.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkTextFild.heightAnchor.constraint(equalToConstant: 50),
            
            checkLabel.topAnchor.constraint(equalTo: checkTextFild.bottomAnchor,constant: 20),
            checkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:150),
            
            checkButton.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 20),
            checkButton.heightAnchor.constraint(equalToConstant: 40),
            checkButton.widthAnchor.constraint(equalToConstant: 200),
            checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
