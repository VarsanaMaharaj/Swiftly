//
//  WeatherService.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/16.
//

import Foundation
import CoreLocation

protocol WeatherServiceProtocol {
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (Result<WeatherResponseModel, Error>) -> Void)
}

class WeatherService: WeatherServiceProtocol {
    private let apiKey = "32dd395a6acffa18009d14e576917144"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (Result<WeatherResponseModel, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0)))
                return
            }

            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponseModel.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
