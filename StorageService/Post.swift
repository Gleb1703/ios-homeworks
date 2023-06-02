//
//  Post.swift
//  Navigation
//
//  Created by gleb on 17/12/2022.
//

import Foundation

public struct Post {

    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int

}

let post1 = Post(author: "Крысиные Новости", description: """
                 Семью крыс обнаружили новосибирцы. Грызуны поселились в мусорных баках между домами №15 и 17 по Вокзальной магистрали.
                 Местные жители предполагают, что семейство примерно из 10 крыс живёт на старых заброшенных гаражах, а на помойку прибегает, чтобы подкрепиться.
                 «Есть две большие крысы и куча поменьше — их потомство, очень милые», — рассказал очевидец нашествия грызунов порталу НГС.
                 """, image: "firstRatNews", likes: 240, views: 950)

let post2 = Post(author: "rambler", description: """
                Сколько именно крыс в Москве – неизвестно, и эксперты не могут назвать точное число во многом потому, что крысы наполняют «подземную» Москву. В Сети можно встретить разные данные – например, что на одного москвича приходится 30–40 крыс.
                Подробнее на Rambler:
                https://news.rambler.ru/other/43448423-tri-metra-nad-urovnem-krysy/
                """, image: "secondRatNews", likes: 1200, views: 1422)

let post3 = Post(author: "Крысиная Правда", description: """
                В одном из маршрутных такси Челябинска пассажиры обнаружили крысу. Грызун не просто появился втранспорте, а вылез из капюшона пассажирки. После — зверек охотно позировал фотографирующим его очевидцам.
                """, image: "thirdRatNews", likes: 929, views: 4934)

let post4 = Post(author: "ЧистыеХвосты.com", description: """
                Помывка крыс

                Мыть крыс нужно осторожно, чтобы вода не попадала в ушки. И делать это нужно не слишком часто, так как шерстку друг другу крысы чистят сами. Но хвосты у крыс легко загрязняются и нуждаются во внимании человека.
                """, image: "fourthRatNews", likes: 268, views: 564)

public var postArray: [Post] = [post1, post2, post3, post4]
