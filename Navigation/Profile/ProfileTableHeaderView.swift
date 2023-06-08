//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Artem Poletaev on 05.09.2022.
//

import UIKit
import SnapKit
class ProfileTableHeaderView: UITableViewHeaderFooterView{
    
    private var statusText: String = ""
    
    private lazy var profileHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var hipsterLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.textAlignment = .center
            textLabel.textColor = .black
            textLabel.backgroundColor = .clear
            textLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            return textLabel
        }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    private lazy var statusTextLabel: UILabel = {
        let statusTextLabel = UILabel()
        statusTextLabel.textColor = .gray
        statusTextLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return statusTextLabel
    }()
    
    private lazy var textFild: UITextField = {
        let textFild = UITextField()
        textFild.textColor = .black
        textFild.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textFild.layer.borderWidth = 1
        textFild.layer.borderColor = UIColor(ciColor: .black).cgColor
        textFild.layer.cornerRadius = 12
        textFild.backgroundColor = .white
        textFild.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textFild
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor(ciColor: .black).cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Set status", for: .normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier identifier: String?) {
        super.init(reuseIdentifier: identifier)
        setupView()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        setupView()
    }
    
    private func setupView() {
        self.addSubview(self.profileHeaderView)
        
        self.addSubview(self.avatarImageView)
        self.addSubview(self.hipsterLabel)
        self.addSubview(self.statusTextLabel)
        self.addSubview(self.textFild)
        self.addSubview(self.button)
        
        //Задача 1
//        Добавьте библиотеку SnapKit через менеджер зависимостей Cocoapods. Используйте последнюю версию библиотеки.
//        Перепишите и сделайте вёрстку визуальных объектов класса ProfileHeaderView при помощи SnapKit.
//        Проверьте, что ваша вёрстка хорошо смотрится на экранах различных устройств от iPhone SE до iPhone 13 Pro Max.

        profileHeaderView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.leading.equalTo(16)
        }
        
        hipsterLabel.snp.makeConstraints { make in
            make.top.equalTo(27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
        }
        statusTextLabel.snp.makeConstraints { make in
            make.bottom.equalTo(textFild.snp.bottom)
            make.size.height.equalTo(100)
            make.trailing.equalTo(-16)
            make.leading.equalTo(hipsterLabel.snp.leading)
        }
        textFild.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(button.snp.top).offset(-20)
        }
        
        button.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(-16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(32)
            make.height.equalTo(50)
        }

    }
    @objc func buttonPressed(){
        if let text = statusTextLabel.text {
            print(text)}
        else {
            print("текущее поле пустое ")}
        statusTextLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
    }
    func setup(fullName: String, avatarimage: UIImage, status: String ){
        hipsterLabel.text = fullName
        avatarImageView.image = avatarimage
        statusTextLabel.text = status
        
    }
}


