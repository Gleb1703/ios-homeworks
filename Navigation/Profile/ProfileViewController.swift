//
//  SecondController.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    private let newButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Button", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        self.title = "Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
        constraints()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    func constraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 265),

            newButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            newButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
