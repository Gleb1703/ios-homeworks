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
        let data = ["Image1","Image2","Image3","Image4","Image5","Image6","Image7","Image8","Image9","Image10","Image11","Image12","Image13","Image14","Image15","Image16","Image17","Image18","Image19","Image20",]
        var tempImage = [PostImage]()
        for (_, names) in data.enumerated() {
            tempImage.append(PostImage(image: names))
        }
        return tempImage
        
    }
    public static func makeArrayImage() -> [UIImage] {
        var tempImages = [UIImage]()
        let data = ["Image1","Image2","Image3","Image4","Image5","Image6","Image7","Image8","Image9","Image10","Image11","Image12","Image13","Image14","Image15","Image16","Image17","Image18","Image19","Image20",]
        for (_,name) in data.enumerated() {
            tempImages.append(UIImage(named: name)!)
        }
        return tempImages
    }
    public static func makeArrayImage(countPhoto: Int, startIndex: Int) -> [UIImage] {
        if (startIndex < PostImage.makeArrayImage().count && startIndex >= 0)  &&  startIndex + countPhoto < PostImage.makeArrayImage().count {
                    return Array(PostImage.makeArrayImage()[startIndex...countPhoto + startIndex - 1])
                }
                return PostImage.makeArrayImage()
        }
    
}
