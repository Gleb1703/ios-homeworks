//
//  CoordinatorProtocol.swift
//  Navigation
//
//  Created by gleb on 08.06.2023.
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
