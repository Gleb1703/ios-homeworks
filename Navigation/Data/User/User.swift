//
//  User.swift
//  Navigation
//
//  Created by gleb on 14.05.2022.
//

import Foundation
import UIKit

protocol UserService {
    
    func loginCheck(login: String) -> User?
}

class User {
    
    var login: String
    var fullName: String
    var avatar: UIImage?
    var status: String
    
    init(login: String, fullName: String, avatar: UIImage?, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

enum Users {
    case main
    case test
    
    var instance: User {
        switch self {
        case .main:
            return User(login: "main", fullName: "twins", avatar: UIImage(named: "Happy Twins"), status: "loves cheese")
        case .test:
            return User(login: "test", fullName: "rat", avatar: UIImage(named: "Best Rat"), status: "Lucky")
        }
    }
}


