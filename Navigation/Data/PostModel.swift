//
//  PostModel.swift
//  Navigation
//
//  Created by gleb on 11/08/2023.
//

import UIKit

struct PostModel {
    
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
    
}

extension PostModel {
    
    static func make() -> [PostModel] {
        [
            PostModel(
                author: "Крысиная семья",
                description: "Они любят друг друга!",
                image: "Post1",
                likes: 900,
                views: 1000
            ),
            PostModel(
                author: "Группа Крысиный Король",
                description: "Сегодня выпустили новый альбом!",
                image: "Post2",
                likes: 450,
                views: 500
            ),
            PostModel(
                author: "Льготы крысам",
                description: "Проезд для крыс стал бесплатным",
                image: "Post3",
                likes: 600,
                views: 700
            ),
            PostModel(
                author: "Мыльная опера",
                description: "Лучший гель для душа уже в продаже",
                image: "Post4",
                likes: 355,
                views: 455
                     )
        ]
    }
}
