//
//  FavoritesCoordinator.swift
//  Navigation
//
//  Created by gleb on 12/08/2023.
//

import Foundation
import UIKit

class FavoritesCoordinator {

    let navigationController: UINavigationController

    let model = CoreDataManager()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func startView() {
        let favoritesCoordinator = FavoritesCoordinator(navigationController: navigationController)
        let favoritesController = FavoritesViewController(model: model, coordinator: favoritesCoordinator)
        navigationController.pushViewController(favoritesController, animated: true)
    }
}
