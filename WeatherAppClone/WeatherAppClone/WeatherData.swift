//
//  WeatherData.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 28.01.2024.
//

import Foundation

struct WeatherData: Decodable {
    let coord: Coordinats
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
//    let rain: Rain
    let clouds: Clouds
    let dt: Int
//    let sys: System
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coordinats: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int
    let grndLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case temp, humidity, pressure
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct Rain: Codable {
    let oneHour: Double
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

struct Clouds: Codable {
    let all: Int
}

struct System: Codable {
    let type: Int
    let id: String
    let country: String
    let sunrise: Int
    let sunset: Int
}


