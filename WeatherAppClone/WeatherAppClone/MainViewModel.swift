//
//  MainViewModel.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 29.01.2024.
//

import Foundation

protocol MainViewModelProtocol {
    func getData(callback: @escaping (WeatherData) -> Void)
}

class MainViewModel: MainViewModelProtocol {
    let client = WeatherClient()
    func getData(callback: @escaping (WeatherData) -> Void) {
        client.getWeatherIn(city: "Moscow") { result in
            switch result {
            case .success(let weatherData):
                callback(weatherData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
