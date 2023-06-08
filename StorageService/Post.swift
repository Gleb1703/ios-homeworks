//
//  Post.swift
//  Navigation
//
//  Created by gleb on 03/06/2023
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
    Post(author: "Крысиная семья", description: "Они любят друг друга!", image: "Post1", views: 1000, likes: 900),
    Post(author: "Группа Крысиный Король", description: "Сегодня выпустили новый альбом!", image: "Post2", views: 500, likes: 450),
    Post(author: "Льготы крысам", description: "Проезд для крыс стал бесплатным", image: "Post3", views: 700, likes: 600),
    Post(author: "Мыльная опера", description: "Лучший гель для душа уже в продаже", image: "Post4", views: 455, likes: 355)]
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

