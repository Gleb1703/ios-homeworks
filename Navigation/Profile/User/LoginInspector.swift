//
//  LoginInspector.swift
//  Navigation
//
//  Created by gleb on 07/06/2023.
//

import UIKit

struct LoginInspector: LoginViewControllerDelegate{
    func check(login: String, pass: String) -> Bool {
        return Checker.shared.check(login: login, pass: pass)
    }
}
