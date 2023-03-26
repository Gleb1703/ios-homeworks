//
//  LoginButton.swift
//  Navigation
//
//  Created by gleb on 26/03/2023.
//

import UIKit

class LoginButton: UIButton {

//    override func updateConfiguration() {
//        switch self.state {
//        case .selected: alpha = 0.2
//        case .highlighted: alpha = 0.2
//        case .disabled: alpha = 0.2
//        default:
//            alpha = 0.5
//        }
//    }

//  FIXIT: вернуть alpha = 0.8
    override var isSelected: Bool {
        didSet {
            alpha = isSelected ? 0.5 : 1.0
        }
    }

    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.5 : 1.0
        }
    }

    override var isEnabled: Bool {
        didSet {
            alpha = isHighlighted ? 1.0 : 0.5
        }
    }

}
