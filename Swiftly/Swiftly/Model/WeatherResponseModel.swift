//
//  WeatherModel.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/14.
//

import Foundation
import SwiftUI

struct WeatherResponseModel: Decodable {
    let main: MainResponse
    let sys: SystemResponse
    let name: String

    struct MainResponse: Decodable {
        let temp: Double
    }

    struct SystemResponse: Decodable {
        let sunrise: Double
        let sunset: Double
    }
}
