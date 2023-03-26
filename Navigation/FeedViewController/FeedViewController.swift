//
//  FirstController.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import UIKit

class FeedViewController: UIViewController {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 10
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

//    var dataSource = Post(title: "показать")

    private let postButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Пост", for: .normal)
        button.layer.borderWidth = 2
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private let postButton2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("Пост 2", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.title = "Feed"
        view.addSubview(stackView)
        stackView.addArrangedSubview(postButton)
        stackView.addArrangedSubview(postButton2)
        constraints()
        addTarget()
    }

    func constraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    func addTarget() {
        postButton.addTarget(self, action: #selector(tapOnBtn), for: .touchUpInside)
    }
    @objc
    func tapOnBtn() {
        let postView = PostViewController()
        navigationController?.pushViewController(postView, animated: true)
    }
    
}
