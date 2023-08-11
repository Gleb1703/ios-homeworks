//
//  AppDelegate.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import RealmSwift

@main

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        FirebaseApp.configure()

        let config = Realm.Configuration(schemaVersion: 1)
        Realm.Configuration.defaultConfiguration = config

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        try! FirebaseAuth.Auth.auth().signOut()
    }
}
