//
//  InfoViewController.swift
//  Navigation
//
//  Created by gleb on 28/12/2022.
//

import UIKit

class InfoViewController: UIViewController{
    
    var residentNames: [String] = []
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Title is loading, please wait..."
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var tatooineOrbitalPeriodLabel: UILabel = {
        let tatooineOrbitalPeriodLabel = UILabel()
        tatooineOrbitalPeriodLabel.text = "Calculating..."
        tatooineOrbitalPeriodLabel.textColor = .white
        tatooineOrbitalPeriodLabel.translatesAutoresizingMaskIntoConstraints = false
        return tatooineOrbitalPeriodLabel
    }()
    
    
    private lazy var showAlertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Alert", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        setupSubview()
        setTitleLabelText()
        setTatooineOrbitalPeriodLabelText()
    }
    
    private func setupSubview() {
        view.addSubview(showAlertButton)
        view.addSubview(titleLabel)
        view.addSubview(tatooineOrbitalPeriodLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            showAlertButton.widthAnchor.constraint(equalToConstant: 100),
            showAlertButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            showAlertButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: showAlertButton.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            tatooineOrbitalPeriodLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tatooineOrbitalPeriodLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            tatooineOrbitalPeriodLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        ])
    }
    
    @objc private func tap() {
        let vc = UIAlertController(title: "Hello", message: "Do you like my homework?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) {
            UIAlertAction in
            NSLog("All right")
        }
        let cancelAction = UIAlertAction(title: "Not quite", style: .default) {
            UIAlertAction in
            NSLog("Needs to be improved")
        }
        vc.addAction(cancelAction)
        vc.addAction(okAction)
        present(vc, animated: true)
    }
    
    // 1
    
    private func setTitleLabelText() {
        getTitle { title in
            DispatchQueue.main.async {
                self.titleLabel.text = title
            }
        }
    }
    
    // 2
    
    private func setTatooineOrbitalPeriodLabelText() {
        getRotationPeriod { period in
            guard (period != nil) else { return }
            DispatchQueue.main.async {
                self.tatooineOrbitalPeriodLabel.text = "Tatooine orbital period is \(period!)"
            }
        }
    }
}
