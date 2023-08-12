//
//  FavoritesViewController.swift
//  Navigation
//
//  Created by gleb on 12/08/2023.
//

import Foundation
import UIKit
import CoreData

class FavoritesViewController: UIViewController {

    // MARK: - Properties
    
    struct Filter {
        var author: String
        var isOn: Bool
    }
    
    private weak var coordinator: FavoritesCoordinator?
    private var viewModel: CoreDataManager?
    private var post: PostModel?
    private var filter = Filter(author: "", isOn: false)
    
    var fetchResultsController: NSFetchedResultsController<FavoritesModel>?

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
        
        initFetchResultsController()
    }

    override func viewWillAppear(_ animated: Bool) {
        CoreDataManager.shared.readFromCoreData()
        do {
            try fetchResultsController?.performFetch()
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - FetchResultsController
    
    private func initFetchResultsController() {
        let request = FavoritesModel.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "author", ascending: true)]
        
        if filter.isOn {
            request.predicate = NSPredicate(format: "author contains[c] %@", filter.author)
        }
        
        let context = CoreDataManager.shared.viewContext

        fetchResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchResultsController?.delegate = self
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
            
            self.title = "Results for \(author)"
            self.filter.author = author
            self.filter.isOn = true
            self.initFetchResultsController()
            do {
                try self.fetchResultsController?.performFetch()
                self.tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }))
        present(alert, animated: true)
    }
    
    @objc func didTapSearchOff() {
        filter.isOn = false
        self.title = "Favourites"
        initFetchResultsController()
        do {
            try self.fetchResultsController?.performFetch()
            self.tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - TableView Extension

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchResultsController?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultsController?.sections?[section].numberOfObjects ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        guard let post = fetchResultsController?.object(at: indexPath) else {
            print("Post could not be fetched")
            return UITableViewCell()
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = .white
        cell.configureCells(post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if let post = fetchResultsController?.object(at: indexPath) {
                CoreDataManager.shared.removeOne(post: post)
            }
            do {
                try self.fetchResultsController?.performFetch()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - NSFetchedResultsControllerDelegate

extension FavoritesViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        @unknown default:
            tableView.reloadData()
        }
    }
}
