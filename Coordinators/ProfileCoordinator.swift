//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by gleb on 08/06/2023.
//

import UIKit

 class ProfileCoordinator: Coordinator {

     var navigationController: UINavigationController

     init(navigationController: UINavigationController) {
         self.navigationController = navigationController
     }
     let screenAssembly = ScreenAssembly()
     func start() {
         let loginVC = screenAssembly.createLogin(coordinator: self)
         loginVC.tabBarItem.title = "Profile"
         loginVC.tabBarItem.image = UIImage(systemName: "person")
         navigationController.pushViewController(loginVC, animated: false)
     }

     func toProfileViewController(with user: User) {
         let profileVC = screenAssembly.createProfile(user: user, coordinator: self)
         navigationController.pushViewController(profileVC, animated: true)
        
     }

     func toPhotosViewController() {
         let vc = screenAssembly.createPhoto()
         navigationController.pushViewController(vc, animated: true)
         
     }
 }
