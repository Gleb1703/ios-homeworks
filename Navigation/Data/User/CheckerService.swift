//
//  CheckerService.swift
//  Navigation
//
//  Created by gleb on 10/08/2023.
//

import Foundation
import FirebaseAuth

protocol CheckerServiceProtocol {
    func checkCredentials(email: String, password: String)
    func signUp(email: String, password: String)
}

class CheckerService: CheckerServiceProtocol {

    static let shared = CheckerService()

    var isSignedIn: Bool = false

    func checkCredentials(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [self] result, error in

            if let error = error {
                print("error: \(error)")
                let error = error as NSError
                switch error.code {

                case AuthErrorCode.userNotFound.rawValue:
                    AlertModel.shared.showTwoActionAlert(title: "User Not Found", message: "Do you want do sign up?", okAction: "Continue", cancelAction: "Cancel") { [self] _ in
                        signUp(email: email, password: password)
                    }
                default:
                    AlertModel.shared.showOkActionAlert(title: "Error", message: "Unable to sign in")
                }
            } else {
                NotificationCenter.default.post(name: Notification.Name("Login successful"), object: isSignedIn)
                isSignedIn = true
            }
        }
    }

    func signUp(email: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                AlertModel.shared.showOkActionAlert(title: "Attention", message: "Unable to sign up")
                print(error.localizedDescription)
            } else {
                AlertModel.shared.showOkActionAlert(title: "Success", message: "You've been signed up")
            }
        }
    }
}
