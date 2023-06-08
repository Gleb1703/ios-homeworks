//
//  FeedModel.swift
//  Navigation
//
//  Created by gleb on 08/06/2023.
//

import UIKit

class FeedModel {
    private let secret = "нагетс"
    
    func check(word: String) -> Bool {
         word == secret
    }
}
