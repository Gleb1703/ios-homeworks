//
//  Service.swift
//  Navigation
//
//  Created by gleb on 11/08/2023.
//

import Foundation
import RealmSwift

class Service {

    let realm = try! Realm()

    func createUser(login: String, password: String) {
        let user = Credentials()
        user.login = login
        user.password = password

        try! realm.write({
            realm.add(user)
        })
    }
}
