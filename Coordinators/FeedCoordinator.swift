//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by gleb on 08/06/2023.
//

import UIKit
 import StorageService

 class FeedCoordinator: Coordinator {
         var post = "Мой пост"
     
     var navigationController: UINavigationController

     init(navigationController: UINavigationController) {
         self.navigationController = navigationController
     }

     func start() {
         let feedVC = FeedViewController()
         feedVC.coordinator = self
         feedVC.tabBarItem.title = "Feed"
         feedVC.tabBarItem.image = UIImage(systemName: "newspaper")
         navigationController.pushViewController(feedVC, animated: false)
     }

     func toPostViewController() {
         let postViewController = PostViewController()
         self.navigationController.pushViewController(postViewController, animated: true)
         postViewController.titlePost = post
        
     }
 }
