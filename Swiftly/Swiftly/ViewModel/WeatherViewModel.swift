//
//  WeatherViewModel.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/14.
//

import Foundation
import CoreLocation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var temperature: String = ""
    @Published var locationName: String = ""
    @Published var sunrise: String = ""
    @Published var sunset: String = ""
    @Published var errorMessage: String?
    
    private let weatherService: WeatherServiceProtocol
    
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        weatherService.fetchWeather(latitude: latitude, longitude: longitude) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.updateUI(with: weather)
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch weather data: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func updateUI(with weather: WeatherResponseModel) {
        self.temperature = "\(Int(weather.main.temp))°C"
        self.locationName = weather.name
        self.sunrise = formatUnixTime(weather.sys.sunrise)
        self.sunset = formatUnixTime(weather.sys.sunset)
    }
    
    private func formatUnixTime(_ unixTime: Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
}
