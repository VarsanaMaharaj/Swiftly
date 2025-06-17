//
//  LocationManager.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/17.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    @Published var latitude: CLLocationDegrees?
    @Published var longitude: CLLocationDegrees?
    @Published var errorMessage: String?

    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager(locationManager, didUpdateLocations: [])
    }
    
    func requestLocation() {
        isLoading = true
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.location = location.coordinate
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            self.errorMessage = nil
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
            self.isLoading = false
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            DispatchQueue.main.async {
                self.errorMessage = "Location permission denied. Please enable it in settings."
            }
        default:
            break
        }
    }
}
