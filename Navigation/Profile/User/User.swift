//
//  User.swift
//  Navigation
//
//  Created by gleb on 06/06/2023.
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
    private let user = User(login: "white", fullName: "White Rat", avatarImage: UIImage(named: "IMG_0924")! , status: "Waiting for something" )
    private let userPass = "white"
    
    func checkLogin(login: String, pass: String) -> User? {
        if (login == user.login) && (pass == userPass) {
            return user
        } else{
            return nil
        }
    }
}
    class TestUserService: UserService {
        private let testUser = User(login: "twins", fullName: "Twins rat", avatarImage: UIImage(named: "twins")! , status: "scared..." )
        private let testUserPass = "twins"
        
        func checkLogin(login: String, pass: String) -> User? {
            if (login == testUser.login) && (pass == testUserPass) {
                return testUser
            } else{
                return nil
            }
            
        }
    }

