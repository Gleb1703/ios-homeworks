//
//  FavoritesViewController.swift
//  Navigation
//
//  Created by gleb on 12/08/2023.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {

    // MARK: - Properties

    private weak var coordinator: FavoritesCoordinator?
    private var viewModel: CoreDataManager?
    private var post: PostModel?
    private var filteredPosts: [FavoritesModel] = []
    private var filterIsOn = false

    // MARK: - Subviews

    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "FavoritesTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Init

    init(model: CoreDataManager, coordinator: FavoritesCoordinator) {
        self.viewModel = model
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favourites"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        setupBarButtonItems()
        setupSubviews()
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        CoreDataManager.shared.readFromCoreData()
        tableView.reloadData()
    }

    // MARK: - Layout
    
    private func setupBarButtonItems() {
        let searchOnButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(didTapSearchOn))
        let searchOffButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapSearchOff))
        navigationItem.rightBarButtonItems = [searchOnButton, searchOffButton]
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc func didTapSearchOn() {
        let alert = UIAlertController(title: "Filter by Author", message: "Enter author name", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Filter", style: .default, handler: { [weak alert] (_) in
            guard let author = alert?.textFields![0].text else { return }
            self.filterIsOn = true
            self.filteredPosts = CoreDataManager.shared.filterByAuthor(author: author)
            self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
    
    @objc func didTapSearchOff() {
        filterIsOn = false
        tableView.reloadData()
    }
}

// MARK: - TableView Extension

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !filterIsOn {
            return CoreDataManager.shared.savedPosts.count
        } else {
            return filteredPosts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        
        if !filterIsOn {
            let post = CoreDataManager.shared.savedPosts[indexPath.row]
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = .white
            cell.configureCells(post)
            return cell
        } else {
            let post = filteredPosts[indexPath.row]
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = .white
            cell.configureCells(post)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] _,_,_ in
            
            guard let self = self else { return }
            
            let post = CoreDataManager.shared.savedPosts[indexPath.row]
            
            if !self.filterIsOn {
                CoreDataManager.shared.removeOne(post: post)
                CoreDataManager.shared.readFromCoreData()
            } else {
                CoreDataManager.shared.removeOne(post: post)
                CoreDataManager.shared.readFromCoreData()
                
                self.filteredPosts.removeAll { object in
                    object.author == post.author && object.likes == post.likes // сравнение лайков на случай, если будет несколько постов одного автора
                }
            }
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()
        }
        deleteAction.image = UIImage(systemName: "trash")
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
