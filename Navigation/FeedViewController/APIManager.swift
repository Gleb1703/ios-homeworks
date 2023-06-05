//
//  APIManager.swift
//  Navigation
//
//  Created by gleb on 18/05/2023.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    let urlString = "https://airlabs.co/api/v9/airlines?&iata_code=AA&api_key=af09262a-3c97-4d8b-8bca-a30d3d1e7dba"
    
    func getSchedules(completion: @escaping (String) -> Void) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let airScheduls = try? JSONDecoder().decode(AirScheduls.self, from: data) {
                completion(airScheduls.response.debugDescription)
            } else {
                print("Fail")
            }
        }
        task.resume()
    }
}
