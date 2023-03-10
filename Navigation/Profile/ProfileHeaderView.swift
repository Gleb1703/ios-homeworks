//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by gleb on 15/01/2023.
//

import UIKit

class ProfileHeaderView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .blue
        layer.cornerRadius = 50
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        
        let label = UILabel(frame: CGRect(x: 150, y: 27, width: 50, height: 50))
        label.text = "Rat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.lightGray
        self.addSubview(label)
        
        let labelTwo = UILabel(frame: CGRect(x: 150, y: 100, width: 90, height: 20))
        labelTwo.text = "loves cheese"
        labelTwo.font = UIFont.systemFont(ofSize: 14)
        labelTwo.textColor = UIColor.gray
        labelTwo.backgroundColor = UIColor.lightGray
        self.addSubview(labelTwo)
        self.addSubview(secondButton)
        addTarget()
        tabOnButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var secondButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 134, width: 310, height: 50))
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        return button
    }()
    
    func addTarget() {
        secondButton.addTarget(self, action: #selector(tabOnButton), for: UIControl.Event.touchUpInside)
    }
    
    @objc func tabOnButton() {
        print("loves cheese")
    }
}
