//
//  SceneDelegate.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let mainCoordinator: MainCoordinator = MainCoordinatorImp()
        self.window = window
        window.rootViewController = mainCoordinator.startApplication()
        window.makeKeyAndVisible()
    }
}
