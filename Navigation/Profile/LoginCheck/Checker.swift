//
//  Checker.swift
//  Navigation
//
//  Created by gleb on 06/06/2023.
//

import UIKit

final class Checker {
    static var shared = Checker()
    
    private let loginCheck: String = "1212"
    private let passCheck: String = "2121"
    var user: User?

        func check(login: String, pass: String) -> Bool {
            if (login == loginCheck) && (pass == passCheck) {
                 user = User(login: "White", fullName: "White Rat", avatarImage: UIImage(named: "IMG_0924")! , status: "Waiting for something" )
                return true
            } else {
                return false
            }
        }
}
