//
//  AdoptedScreenViewModel.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 11.02.2024.
//

import Foundation

protocol AdoptedScreenViewModelProtocol {
    func getData(callback: @escaping (WeatherData) -> Void)
    var weatherData: WeatherData { get }
}

class AdoptedScreenViewModel: AdoptedScreenViewModelProtocol {
    var weatherData: WeatherData = .empty
    let client = WeatherClient()
    func getData(callback: @escaping (WeatherData) -> Void) {
        client.getWeatherIn(city: "Moscow") { [ weak self ] result in
            switch result {
            case .success(let weatherData):
                self?.weatherData = weatherData
                callback(weatherData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
