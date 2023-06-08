//
//  User.swift
//  Navigation
//
//  Created by Artem Poletaev on 03.11.2022.
//

import UIKit

protocol UserService {
    func checkLogin(login: String, pass: String) -> User?
}

class User {
    let login: String
    let fullName: String
    let avatarImage: UIImage
    let status: String
    
    init(login: String, fullName: String, avatarImage: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatarImage = avatarImage
        self.status = status
    }
}

class CurrentUserService: UserService {
    private let user = User(login: "hipster", fullName: "Hipster Cat", avatarImage: UIImage(named: "IMG_0924")! , status: "Waiting for something" )
    private let userPass = "cat"
    
    func checkLogin(login: String, pass: String) -> User? {
        if (login == user.login) && (pass == userPass) {
            return user
        } else{
            return nil
        }
    }
}
    class TestUserService: UserService {
        private let testUser = User(login: "mops", fullName: "Hipster dog", avatarImage: UIImage(named: "dog1")! , status: "I'm pretty" )
        private let testUserPass = "dog"
        
        func checkLogin(login: String, pass: String) -> User? {
            if (login == testUser.login) && (pass == testUserPass) {
                return testUser
            } else{
                return nil
            }
            
        }
    }

