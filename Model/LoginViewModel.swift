//
//  LoginViewModel.swift
//  Navigation
//
//  Created by gleb on 08/06/2023.
//

import Foundation

class LoginViewModel {
    
    
    let coordinator: ProfileCoordinator
    
    var loginFactory: LoginFactory
    
    
    enum LoginError: Error {
        case emptyFields
        case invalidCredentials
    }
    
    init(model: LoginFactory, coordinator: ProfileCoordinator) {
        self.loginFactory = model
        self.coordinator = coordinator
    }

    func buttonTapped(login: String, pass: String) throws {
        guard !login.isEmpty, !pass.isEmpty else {
            throw LoginError.emptyFields
        }

        if loginFactory.makeLoginInspector().check(login: login, pass: pass) {
            let user = Checker.shared.user!
            coordinator.toProfileViewController(with: user)
        } else {
            throw LoginError.invalidCredentials
        }
    }

}
