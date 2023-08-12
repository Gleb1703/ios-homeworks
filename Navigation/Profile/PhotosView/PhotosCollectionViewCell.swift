//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by gleb on 06/06/2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    lazy var photoPreview: UIImageView = {
        let photoPreview = UIImageView(frame: .zero)
        photoPreview.contentMode = .scaleAspectFill
        
        photoPreview.translatesAutoresizingMaskIntoConstraints = false
        return photoPreview
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupSubview()
        setupConstraints()
    }
    
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemBackground
    }
    
    private func setupSubview() {
        contentView.addSubview(photoPreview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoPreview.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoPreview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    
    func setupMethod(with photo: UIImage) {
        photoPreview.image = photo
    }
}
