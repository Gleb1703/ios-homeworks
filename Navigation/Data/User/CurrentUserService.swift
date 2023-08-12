//
//  CurrentUserService.swift
//  Navigation
//
//  Created by gleb on 11/08/2023.
//

import Foundation
import UIKit

class CurrentUserService: UserService {
    
    let user = Users.main.instance
    
    func loginCheck(login: String) -> User? {
        if login == user.login {
            return user
        } else {
            return nil
        }
    }
}
