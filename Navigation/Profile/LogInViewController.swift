//
//  LogInViewController.swift
//  Navigation
//
//  Created by gleb on 25/03/2023.
//

import UIKit

class LogInViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = .systemGray6
        view.distribution = .fillProportionally
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let loginTextField: TextFieldWithPadding = {
        let login = TextFieldWithPadding()
        login.placeholder = "Email or phone"
        login.keyboardType = .emailAddress
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16)
        login.tintColor = UIColor(named: "ColorSet")
        login.autocapitalizationType = .none
        return login
    }()

    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    private let passwordTextField: TextFieldWithPadding = {
        let pasword = TextFieldWithPadding()
        pasword.placeholder = "Password"
        pasword.isSecureTextEntry = true
        pasword.textColor = .black
        pasword.font = UIFont.systemFont(ofSize: 16)
        pasword.tintColor = UIColor(named: "ColorSet")
        pasword.autocapitalizationType = .none
        return pasword
    }()

    private let loginButton: LoginButton = {
        let button = LoginButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(loginButton)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(lineView)
        stackView.addArrangedSubview(passwordTextField)

        constraints()
        setupGestures()
        addTarget()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

//  MARK: - Методы
    func constraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            lineView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
    }

    func addTarget() {
        loginButton.addTarget(self, action: #selector(tapOnBtn), for: .touchUpInside)
    }
    @objc
    func tapOnBtn() {
        let profileView = ProfileViewController()
        navigationController?.pushViewController(profileView, animated: true)
    }
    
//  MARK: - убираем клавиатуру по нажатию в любом месте экрана
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapHideKbd))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func viewTapHideKbd() {
        view.endEditing(true)
        scrollView.setContentOffset(.zero, animated: true)
    }

//  MARK: - сдвигаем контент при перекрытии клавиатурой
    @objc func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let bottomButtonY = loginButton.frame.origin.y + loginButton.frame.height
            let offset = UIScreen.main.bounds.height - kbdSize.height - bottomButtonY - 60
            if offset < 0 {
                scrollView.contentOffset = CGPoint(x: 0, y: -offset)
            }
        }
    }
    @objc func kbdHide(notification: NSNotification) {
        viewTapHideKbd()
    }

}
