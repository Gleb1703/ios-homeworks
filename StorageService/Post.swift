//
//  Post.swift
//  Navigation
//
//  Created by Artem Poletaev on 17.07.2022.
//

import UIKit

public struct Post {
    
    public var author: String
    public  var description: String
    public var image: String
    public var views: Int
    public var likes: Int
}

public struct StorageOfPosts {
    
    public static let viewModel: [Post] = [
    Post(author: "Очень странные дела", description: "Сериал о двух мирах", image: "Post1", views: 1000, likes: 900),
    Post(author: "Удача", description: "Мультик про кота и девочку без удачи", image: "Post2", views: 500, likes: 450),
    Post(author: "Медленные лошади", description: "Сериал про неудачников из m5", image: "Post3", views: 700, likes: 600),
    Post(author: "Не сработало", description: "Сериал про стартап", image: "Post4", views: 455, likes: 355)]
}

public struct PostImage {
    public var image: String
    
    public static func setupImages() -> [PostImage]{
        let data = ["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10","image11","image12","image13","image14","image15","image16","image17","image18","image19","image20",]
        var tempImage = [PostImage]()
        for (_, names) in data.enumerated() {
            tempImage.append(PostImage(image: names))
        }
        return tempImage
    }
}

