//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by gleb on 07/06/2023.
//

import UIKit

import Foundation

protocol LoginViewControllerDelegate {
    func check(login: String, pass: String) -> Bool
}
