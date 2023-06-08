//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by gleb on 08/06/2023.
//

import Foundation
import StorageService

class ProfileViewModel {
    var cartoons: [Post]?
    var oneMoreTmpUser: User?
    
    var user: User? {
        didSet {
            self.userDidChange?(self)
        }
    }
    
    var userDidChange: ((ProfileViewModel) -> ())?
    
    init(userfromLogin: User, cartoons: [Post]) {
        self.oneMoreTmpUser = userfromLogin
        self.cartoons = cartoons
    }
    
    func getData() {
        user = oneMoreTmpUser
    }
}
