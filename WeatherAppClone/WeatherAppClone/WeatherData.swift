//
//  WeatherData.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 28.01.2024.
//

import Foundation

struct WeatherData: Decodable {
    let lonCoord: Double
    let latCoord: Double
    let weatherID: Int
    let weatherMain: String
    let weatherDescription: String
    let weatherIcon: String
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int
    let grndLevel: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let rainLh: Double
    let cloudsAll: Int
    let dt: Int
    let sysType: Int
    let sysID: String
    let country: String
    let sunrise: Int
    let sunset: Int
    let timezone: Int
    let cityID: Int
    let cityName: String
    let code: Int
}
