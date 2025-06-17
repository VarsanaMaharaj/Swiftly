//
//  MainScreenView.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/17.
//

import SwiftUI
import CoreLocationUI

struct MainScreenView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Please share your current location to get the weather in your area")
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
                .padding(40)
                Text("Select View Weather to see the weather")
                NavigationLink(destination: WeatherView(), label: {
                    Label("View Weather", systemImage: "cloud.sun")
                })
                .padding()
                Text("Click on To do list to view the list")
                NavigationLink(destination: TaskListView(), label: {
                    Label("To Do List", systemImage: "pencil")
                })
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .navigationTitle("Welcome to Swiftly 📝")
    }
}

#Preview {
    NavigationView() {
        MainScreenView()
            .modelContainer(for: TaskModel.self)
    }
}
