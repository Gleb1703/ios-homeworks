//
//  CoordinatorProtocol.swift
//  Navigation
//
//  Created by Artem Poletaev on 04.04.2023.
//

import UIKit

 protocol Coordinator: AnyObject {
     var navigationController: UINavigationController { get set }

     func start()
 }

 protocol TabbarCoordinatorProtocol: AnyObject {
     var tabbarController: UITabBarController { get set }

     func start()
 }
