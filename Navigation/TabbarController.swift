//
//  TabbarController.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import UIKit

class TabBarController: UITabBarController{
    
    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationController : UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        firstTabNavigationController = UINavigationController.init(rootViewController: FeedViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        
        self.viewControllers = [firstTabNavigationController, secondTabNavigationController]
        
        let item1 = UITabBarItem(title: "Feed",
                                 image: UIImage(systemName: "newspaper"),
                                 tag: 0)
        let item2 = UITabBarItem(title: "Profile",
                                 image: UIImage(systemName: "person.circle"),
                                 tag: 1)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2
        
        UITabBar.appearance().tintColor = UIColor(red: 10/255.0, green: 10/255.0, blue: 20/255.0, alpha: 1)
        UITabBar.appearance().backgroundColor = .white
    }
}
