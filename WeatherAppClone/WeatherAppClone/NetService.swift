//
//  NetService.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 26.01.2024.
//

import Foundation



class NetService {
    func makeRequest(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request: URLRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, responce, error in
            if let error {
                completion(.failure(error))
            } else if let data {
                completion(.success(data))
            } else if let responce = responce as? HTTPURLResponse { // Переделать
                if responce.statusCode != 200 {
                    print(responce.statusCode)
                }
            }
        }.resume()
    }
}

//class NetService2 {
//    func makeRequest(url: URL) async throws -> Data {
//        let request: URLRequest = URLRequest(url: url)
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        guard let httpResponse = response as? HTTPURLResponse else {
//            throw URLError(.badServerResponse)
//        }
//
//        guard httpResponse.statusCode == 200 else {
//            throw URLError(.init(rawValue: httpResponse.statusCode))
//        }
//
//        return data
//    }
//}
