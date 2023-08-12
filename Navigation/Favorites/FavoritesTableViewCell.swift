//
//  FavoritesTableViewCell.swift
//  Navigation
//
//  Created by gleb on 12/08/2023.
//

import Foundation
import UIKit

class FavoritesTableViewCell: UITableViewCell {

    // MARK: - Subviews

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var likesCount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var viewsCount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = true

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill

        stackView.addArrangedSubview(likesCount)
        stackView.addArrangedSubview(viewsCount)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    func setupSubviews() {
        self.addSubview(authorLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(postImage)
        self.addSubview(stackView)
    }

    func setupConstraints() {

        let safeArea = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([

            authorLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            authorLabel.bottomAnchor.constraint(equalTo: postImage.topAnchor, constant: -12),

            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImage.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16),
            postImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: safeArea.widthAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),

            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
        ])
    }

    // MARK: - Congifure Cells

    public func configureCells(_ post: FavoritesModel) {
        self.authorLabel.text = post.author
        self.postImage.image = UIImage(data: post.image ?? Data()) ?? UIImage()
        self.descriptionLabel.text = post.descr
        self.likesCount.text = "Likes: \(post.likes)"
        self.viewsCount.text = "Views: \(post.views)"
    }
}
