//
//  TabBarController.swift
//  Navigation
//
//  Created by gleb on 10/08/2023.
//

import UIKit

class TabBarController: UITabBarController {

    private let loginVC = Factory(navigationController: UINavigationController(), viewController: .login)
    private let feedVC = Factory(navigationController: UINavigationController(), viewController: .feed)

    override func viewDidLoad() {
        super.viewDidLoad()

        setControllers()
    }

    func setControllers() {
        viewControllers = [feedVC.navigationController, loginVC.navigationController]
    }
}
