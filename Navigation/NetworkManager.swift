//
//  NetworkManager.swift
//  Navigation
//
//  Created by gleb on 19/07/2023.
//

import Foundation

public struct NetworkManager {
    
    let urlStarships = URL(string: "https://swapi.dev/api/starships/3")
    let urlPeople = URL(string: "https://swapi.dev/api/people/5")

    static func request(for configuration: AppConfiguration) {
        if let urlPlanets = URL(string: "https://swapi.dev/api/planets/5"){
            let dataTask = URLSession.shared.dataTask(with: urlPlanets) { data, response, error in
                print(error)
            }
            dataTask.resume()
        }
    }
}

enum AppConfiguration: String {
    
    case planets = "https://swapi.dev/api/planets/5"
    case starships = "https://swapi.dev/api/starships/3"
    case people = "https://swapi.dev/api/people/5"
    
}
