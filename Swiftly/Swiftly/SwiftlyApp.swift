//
//  SwiftlyApp.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/14.
//

import SwiftUI
import SwiftData

@main
struct SwiftlyApp: App {
        
    var body: some Scene {
        WindowGroup {
            NavigationView() {
                MainScreenView()
            }
            .modelContainer(for: TaskModel.self)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
