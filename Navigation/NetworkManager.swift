//
//  NetworkManager.swift
//  Navigation
//
//  Created by gleb on 19/07/2023.
//

import Foundation

struct NetworkManager {

    static func request(for configuration: AppConfiguration) {
        switch configuration {
        case .films(let value):
            guard let url = URL(string: value) else { return }
            dataTask(url)
        case .vehicles(let value):
            guard let url = URL(string: value) else { return }
            dataTask(url)
        case .planets(let value):
            guard let url = URL(string: value) else { return }
            dataTask(url)
        }
    }

    static func dataTask(_ address: URL) {
        let session = URLSession.shared
        let task = session.dataTask(with: address) { data, response, error in

            if let error = error {
                print("Error occurred: \(error.localizedDescription.debugDescription)")
                // Code=-1009 "The Internet connection appears to be offline.
            } else {
                guard let data = data else { return }
                let string = String(decoding: data, as: UTF8.self)
                print("Received data: \(string)")

                if let response = response as? HTTPURLResponse {
                    print("Full response: \(response.allHeaderFields), status code: \(response.statusCode)")
                }
            }
        }
        task.resume()
    }
}
