//
//  SecondController.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import StorageService
import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tView = UITableView()
        tView.backgroundColor = .lightGray
        tView.tableHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 265))
        tView.dataSource = self
        tView.delegate = self
        tView.showsVerticalScrollIndicator = false
        tView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tView.translatesAutoresizingMaskIntoConstraints = false
        return tView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
        view.backgroundColor = .blue
        #else
        view.backgroundColor = .red
        #endif
        view.addSubview(tableView)
        setup()
        setupGestures()
    }

    func setup() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    //  MARK: - убираем клавиатуру по нажатию в любом месте экрана
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapHideKbd))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func viewTapHideKbd() {
        view.endEditing(true)
    }

}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postArray.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableViewCell()
        cell.backgroundColor = .white
        cell.fillData(with: postArray, indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 265
    }

}
