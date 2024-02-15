//
//  WeatherService.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 26.01.2024.
//

import Foundation



class WeatherClient {
    
    private let urlString: String = "https://api.openweathermap.org/data/2.5/weather?"
    private let key: String = "bfcab28b74d1fe5368c43e4766daa14c"
    private let metric: String = "units=metric"
    
    
    let networkService = NetService()
    
    func getWeatherIn(city: String, complition: @escaping (Result<WeatherData, Error>) -> (Void)) {
        guard
            let url = URL(string: "\(urlString)q=\(city)&\(metric)&APPID=\(key)")
        else {
//            complition(.failure(error))
            return
        }
        networkService.makeRequest(url: url) { result in
            switch result {
            case .success(let data):
                do {
                   let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    //  String(data: data, encoding: .utf8)
                    complition(.success(weatherData))
                } catch {
                    complition(.failure(error))          
                }
                
            case .failure(let error):
                complition(.failure(error))  
            }
        }
    }
}


