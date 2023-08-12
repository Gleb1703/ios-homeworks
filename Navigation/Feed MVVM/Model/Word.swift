//
//  Word.swift
//  Navigation
//
//  Created by gleb on 10/08/2023.
//

import Foundation
import UIKit

struct Word {
    let secretWord: String?
}

extension Word {
    static var words = [
        Word(secretWord: "BigRat")
    ]
}
