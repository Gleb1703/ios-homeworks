//
//  AirScheduls.swift
//  Navigation
//
//  Created by gleb on 18/05/2023.
//

import Foundation

// MARK: - AirScheduls
struct AirScheduls: Codable {
    let request: Request
    let response: [Response]
    let terms: String
}

// MARK: - Request
struct Request: Codable {
    let lang, currency: String
    let time: Int
    let id, server, host: String
    let pid: Int
    let key: Key
    let params: Params
    let version: Int
    let method: String
    let client: Client
}

// MARK: - Client
struct Client: Codable {
    let ip: String
    let geo: Geo
    let connection: Connection
    let device, agent: Agent
    let karma: Karma
}

// MARK: - Agent
struct Agent: Codable {
}

// MARK: - Connection
struct Connection: Codable {
    let type: String
    let ispCode: Int
    let ispName: String

    enum CodingKeys: String, CodingKey {
        case type
        case ispCode = "isp_code"
        case ispName = "isp_name"
    }
}

// MARK: - Geo
struct Geo: Codable {
    let countryCode, country, continent, city: String
    let lat, lng: Double
    let timezone: String

    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case country, continent, city, lat, lng, timezone
    }
}

// MARK: - Karma
struct Karma: Codable {
    let isBlocked, isCrawler, isBot, isFriend: Bool
    let isRegular: Bool

    enum CodingKeys: String, CodingKey {
        case isBlocked = "is_blocked"
        case isCrawler = "is_crawler"
        case isBot = "is_bot"
        case isFriend = "is_friend"
        case isRegular = "is_regular"
    }
}

// MARK: - Key
struct Key: Codable {
    let id: Int
    let apiKey, type, expired, registered: String
    let limitsByHour, limitsByMinute, limitsByMonth, limitsTotal: Int

    enum CodingKeys: String, CodingKey {
        case id
        case apiKey = "api_key"
        case type, expired, registered
        case limitsByHour = "limits_by_hour"
        case limitsByMinute = "limits_by_minute"
        case limitsByMonth = "limits_by_month"
        case limitsTotal = "limits_total"
    }
}

// MARK: - Params
struct Params: Codable {
    let iataCode, lang: String

    enum CodingKeys: String, CodingKey {
        case iataCode = "iata_code"
        case lang
    }
}

// MARK: - Response
struct Response: Codable {
    let name, iataCode, icaoCode: String

    enum CodingKeys: String, CodingKey {
        case name
        case iataCode = "iata_code"
        case icaoCode = "icao_code"
    }
}
