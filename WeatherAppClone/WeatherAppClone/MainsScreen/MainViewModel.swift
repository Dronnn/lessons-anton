//
//  MainViewModel.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 29.01.2024.
//

import Foundation

protocol MainViewModelProtocol {
    func getData(callback: @escaping (WeatherData) -> Void)
    var weatherData: WeatherData { get }
}

class MainViewModel: MainViewModelProtocol {
    var weatherData: WeatherData = .empty
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

//func name(param: Int) -> Int { return 0 }
//
//func name1(peram: URL, callback: @escaping () -> Void) { return 0 }
//
//func clisrnt() {
//    name1(peram: URL(string: "")!, callback: {
//        
//    })
//}
