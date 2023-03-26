//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by gleb on 26/03/2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var descriptionText: UILabel = {
        let desc = UILabel()
        desc.numberOfLines = 0
        desc.textColor = .systemGray
        desc.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        desc.translatesAutoresizingMaskIntoConstraints = false
        return desc
    }()

    private var likesLabel: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    private var viewsLabel: UILabel = {
        let views = UILabel()
        views.textColor = .black
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textAlignment = .right
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionText)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)

        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(Constants.standartMarggin)),
            authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CGFloat(Constants.standartMarggin)),
            authorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: CGFloat(Constants.standartMarggin)),

            postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),

            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: CGFloat(Constants.standartMarggin)),
            descriptionText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CGFloat(Constants.standartMarggin)),
            descriptionText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -CGFloat(Constants.standartMarggin)),

            likesLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: CGFloat(Constants.standartMarggin)),
            likesLabel.leftAnchor.constraint(equalTo: descriptionText.leftAnchor),
            likesLabel.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - CGFloat(Constants.standartMarggin)),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -CGFloat(Constants.standartMarggin)),

            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - CGFloat(Constants.standartMarggin)),
            viewsLabel.rightAnchor.constraint(equalTo: descriptionText.rightAnchor)
        ])
    }

    func fillData(with data: [Post], indexPath: IndexPath) {
        authorLabel.text = postArray[indexPath.row].author
        postImageView.image = UIImage(named: postArray[indexPath.row].image)
        descriptionText.text = postArray[indexPath.row].description
        likesLabel.text = "Likes: \(String(postArray[indexPath.row].likes)) ❤️"
        viewsLabel.text = "Views: \(String(postArray[indexPath.row].views)) 👁️"
    }

}
