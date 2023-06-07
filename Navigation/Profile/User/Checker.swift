//
//  Checker.swift
//  Navigation
//
//  Created by gleb on 07/06/2023.
//

import UIKit

final class Checker {
    static var shared = Checker()
    
    private let loginCheck: String = "www"
    private let passCheck: String = "aa"
    var user: User?

        func check(login: String, pass: String) -> Bool {
            if (login == loginCheck) && (pass == passCheck) {
                 user = User(login: "white", fullName: "White Rat", avatarImage: UIImage(named: "IMG_0924")! , status: "Waiting for something" )
                return true
            } else {
                return false
            }
        }
}
