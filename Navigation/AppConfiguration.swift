//
//  AppConfiguration.swift
//  Navigation
//
//  Created by gleb on 07/08/2023.
//

import Foundation

enum AppConfiguration: CaseIterable {

    case films(String)
    case vehicles(String)
    case planets(String)

    static var allCases: [AppConfiguration] {
        return [
            .films("https://swapi.dev/api/films/2"),
            .vehicles("https://swapi.dev/api/vehicles/6"),
            .planets("https://swapi.dev/api/planets/4")
        ]
    }
}
