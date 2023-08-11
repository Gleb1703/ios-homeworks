//
//  Model.swift
//  Navigation
//
//  Created by gleb on 11/08/2023.
//

import Foundation
import RealmSwift

class Credentials: Object {

    @Persisted var login = ""
    @Persisted var password = ""
}
