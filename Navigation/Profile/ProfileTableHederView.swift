//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by gleb on 15/01/2023.
//

import UIKit

class ProfileHeaderView: UIView {

    private var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = CGFloat(Constants.avatar / 2)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "icon")
        return view
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: CGFloat(Constants.fullNameFontSize), weight: .bold)
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "loves cheese..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: CGFloat(Constants.statusFontSize), weight: .regular)
        return label
    }()

    private var statusText = ""
    private var statusTextField: TextFieldWithPadding = {
        let tfield = TextFieldWithPadding()
        tfield.backgroundColor = .white
        tfield.layer.cornerRadius = 12
        tfield.layer.borderWidth = 1
        tfield.layer.borderColor = UIColor.black.cgColor
        tfield.textColor = .black
        tfield.font = UIFont.systemFont(ofSize: CGFloat(Constants.setStatusFontSize), weight: .regular)
        tfield.placeholder = "Cтатус..."
        return tfield
    }()

    private let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()

    override init(frame: CGRect) {

        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(secondButton)
        addSubview(statusTextField)
        setupFrames()
        addTarget()
        
        translatesAutoresizingMaskIntoConstraints = false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupFrames() {
        avatarImageView.frame = CGRect(x: Constants.standartMarggin,
                                       y: Constants.standartMarggin,
                                       width: Constants.avatar,
                                       height: Constants.avatar)
        fullNameLabel.frame = CGRect(x: 2 * Constants.standartMarggin + Constants.avatar,
                                     y: Constants.fullNameTopMargin,
                                     width: Int(UIScreen.main.bounds.width) - (3 * Constants.standartMarggin + Constants.avatar),
                                     height: Constants.fullNameFontSize + 4)
        statusLabel.frame = CGRect(x: 2 * Constants.standartMarggin + Constants.avatar,
                                   y: 2 * Constants.standartMarggin + Constants.avatar - Constants.statusBottomMargin - (Constants.statusFontSize + 4),
                                   width: Int(UIScreen.main.bounds.width) - (3 * Constants.standartMarggin + Constants.avatar),
                                   height: Constants.statusFontSize + 4)
        secondButton.frame = CGRect(x: Constants.standartMarggin,
                                       y: 4 * Constants.standartMarggin + Constants.avatar,
                                       width: Int(UIScreen.main.bounds.width) - (2 * Constants.standartMarggin),
                                       height: Constants.setStatusBtnHeight)
        statusTextField.frame = CGRect(x: 2 * Constants.standartMarggin + Constants.avatar,
                                       y: 2 * Constants.standartMarggin + Constants.avatar - Constants.statusBottomMargin + Constants.standartMarggin / 2,
                                       width: Int(UIScreen.main.bounds.width) - (3 * Constants.standartMarggin + Constants.avatar),
                                       height: Constants.setStatusTFHeight)
    }

    func addTarget() {
        secondButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    @objc
    func buttonPressed() {
        statusLabel.text = statusText
        statusTextField.text = ""
    }
    @objc
    func statusTextChanged( _textField: UITextField) {
        statusText = statusTextField.text ?? ""
    }

}
