//
//  LoginInspector.swift
//  Navigation
//
//  Created by gleb on 11/08/2023.
//

import Foundation

protocol LoginViewControllerDelegate {

    func check(email: String, password: String) -> Bool

}

struct LoginInspector: LoginViewControllerDelegate {

    func check(email: String, password: String) -> Bool {
        CheckerService.shared.signInWithRealm(login: email, password: password)
        if CheckerService.shared.isSignedIn == true {
            return true
        } else {
            return false
        }
    }
}
