//
//  LogInViewController.swift
//  Navigation
//
//  Created by gleb on 25/03/2023.
//

import UIKit

class LogInViewController: UIViewController{
    
    var loginDelegate: LoginViewControllerDelegate?
    static var loginFactoryDelegate: LoginFactory?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var vkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = (UIImage(named: "Vklogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.layer.borderWidth = 0.5
        stackView.backgroundColor = .black
        stackView.setCustomSpacing(0.5, after: loginTextField)
        stackView.layer.borderColor = CGColor(gray: 0.1, alpha: 1)
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "   Email or phone"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "   Password"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "ColorBlue")
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(Any.self, action: #selector(goToProfile), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginTextField.becomeFirstResponder()
    }
    
    @objc func goToProfile() {
        
#if DEBUG
    let choiseLoginService = TestUserService().checkLogin(login: loginTextField.text!, pass: passwordTextField.text!)
#else
    let choiseLoginService = CurrentUserService().checkLogin(login: loginTextField.text!, pass: passwordTextField.text!)
#endif
        if let checkedUser = choiseLoginService {
            let profileVC = ProfileViewController()
            profileVC.newUser = checkedUser
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Unknown login", message: "Please, enter correct user login", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                        self.present(alert, animated: true)

            
        }
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(vkImageView)
        scrollView.addSubview(textFieldsStackView)
        scrollView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            vkImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            vkImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            vkImageView.widthAnchor.constraint(equalToConstant: 100),
            vkImageView.heightAnchor.constraint(equalToConstant: 100),
            vkImageView.bottomAnchor.constraint(equalTo: textFieldsStackView.topAnchor, constant: -120),
            
            textFieldsStackView.topAnchor.constraint(equalTo: vkImageView.bottomAnchor, constant: 120),
            textFieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginButton.leadingAnchor.constraint(equalTo: textFieldsStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: textFieldsStackView.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY = loginButton.frame.origin.y + loginButton.frame.height
            let keyboardOriginY = view.frame.height - keyboardHeight
            
            let offset = keyboardOriginY <= loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0
            
            scrollView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
        scrollView.setContentOffset(.zero, animated: true)
    }
    
    
    
}

