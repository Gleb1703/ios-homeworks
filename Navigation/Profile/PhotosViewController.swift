//
//  PhotosViewController.swift
//  Navigation
//
//  Created by gleb on 06/06/2023.
//

import UIKit
// import StorageService
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    private var recivedImages: [UIImage] = []
    private let imageFasade = ImagePublisherFacade()
    private var startTime = Date()
    private var imageProcessor: ImageProcessor?
   
    var textTitle: String?
    
    private let postImage = PostImage.makeArrayImage()
    
    private enum Constants {
        static let numberOfLine: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "defaultcell")
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupImageProcessor()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
                imageFasade.removeSubscription(for: self)
            }
       
    private func setupImageProcessor() {
        let imageProcessor = ImageProcessor()
        //MARK: userInitiated - 0.7 секунды
        imageProcessor.processImagesOnThread(sourceImages: PostImage.makeArrayImage(countPhoto: 10, startIndex: 5), filter: .bloom(intensity: 30), qos: .userInteractive) { cgImages in
            for image in cgImages {
                self.recivedImages.append(UIImage(cgImage: image!))
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            print("Загрузка \(Date().timeIntervalSince(self.startTime)) секунд(ы)")
        }
        
//        //MARK: userInitiated - 1.31 секунды
//        imageProcessor.processImagesOnThread(sourceImages: postImage, filter: .bloom(intensity: 30), qos: .userInteractive) { cgImages in
//            for image in cgImages {
//                self.recivedImages.append(UIImage(cgImage: image!))
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//            print("Загрузка \(Date().timeIntervalSince(self.startTime)) секунд(ы)")
//        }
        
//        //MARK: userInitiated - 1.29 секунды
//        imageProcessor.processImagesOnThread(sourceImages: postImage, filter: .bloom(intensity: 30), qos: .userInitiated) { cgImages in
//            for image in cgImages {
//                self.recivedImages.append(UIImage(cgImage: image!))
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//            print("Загрузка \(Date().timeIntervalSince(self.startTime)) секунд(ы)")
//        }
//
//        //MARK: default - 1.15секунды
//        imageProcessor.processImagesOnThread(sourceImages: postImage, filter: .motionBlur(radius: 60), qos: .default) { cgImages in
//            for image in cgImages {
//                self.recivedImages.append(UIImage(cgImage: image!))
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//            print("Загрузка \(Date().timeIntervalSince(self.startTime)) секунд(ы)")
//        }
        
//        //MARK: background - 4.76 секунды
//        imageProcessor.processImagesOnThread(sourceImages: postImage, filter: .vignette(intensity: 70, radius: 30), qos: .background) { cgImages in
//            for image in cgImages {
//                self.recivedImages.append(UIImage(cgImage: image!))
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//            print("Загрузка \(Date().timeIntervalSince(self.startTime)) секунд(ы)")
//        }

        //MARK: utility - 1.07 секунды
//        imageProcessor.processImagesOnThread(sourceImages: postImage, filter: .noir, qos: .utility) { cgImages in
//            for image in cgImages {
//                self.recivedImages.append(UIImage(cgImage: image!))
//            }
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//            print("Загрузка \(Date().timeIntervalSince(self.startTime)) секунд(ы)")
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = textTitle
        print("viewWillAppear")
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        imageFasade.rechargeImageLibrary()
    
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recivedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return collectionView.dequeueReusableCell(withReuseIdentifier: "defaultcell", for: indexPath)}
        let avaImage = recivedImages[indexPath.item]
        cell.setup(image: avaImage)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Section - \(indexPath.section) - Item \(indexPath.item)")
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let needed = collectionView.frame.width - (Constants.numberOfLine - 1) * spacing - insets.left - insets.right
        let itemwidth = floor(needed / Constants.numberOfLine)
        print(itemwidth)
        return CGSize(width: itemwidth, height: itemwidth)
    }
    
}
extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        recivedImages = images
        collectionView.reloadData()
    }
    
}
