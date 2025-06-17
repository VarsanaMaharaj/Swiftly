//
//  WeatherView.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/14.
//
import Foundation
import SwiftUI
import CoreLocationUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            Image(systemName: "sun.max.fill")
                .font(.system(size: 40))
            Text("Temperature: \(viewModel.temperature)")
                .font(.title)
                .padding()

            Text(viewModel.locationName)
                .font(.title)
                .padding()
            Text("🌅 Sunrise: \(viewModel.sunrise)")
                .font(.subheadline)

            Text("🌄 Sunset: \(viewModel.sunset)")
                .font(.subheadline)

            if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .onAppear() {
            locationManager.requestLocation()
            viewModel.fetchWeather(latitude: locationManager.latitude ?? 4.0, longitude: locationManager.longitude ?? 4.0)
        }
    }
}

#Preview {
    NavigationView() {
        WeatherView()
            .modelContainer(for: TaskModel.self, inMemory: true)
    }
}
