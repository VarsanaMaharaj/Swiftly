//
//  SwiftlyUITests.swift
//  SwiftlyUITests
//
//  Created by Varsana Maharaj on 2025/06/14.
//

import XCTest

final class MainScreenViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testMainScreenViewElementsExist() throws {
        // Check for main text
        XCTAssertTrue(app.staticTexts["Please share your current location to get the weather in your area"].exists)
        
        // Check LocationButton by accessibility label (default label from .shareCurrentLocation)
        // LocationButton is a button with label "Share Current Location"
        XCTAssertTrue(app.buttons["Share Current Location"].exists)
        
        // Check "Select View Weather to see the weather" text
        XCTAssertTrue(app.staticTexts["Select View Weather to see the weather"].exists)
        
        // Check NavigationLink to WeatherView (label has "View Weather")
        XCTAssertTrue(app.buttons["View Weather"].exists)
        
        // Check "Click on To do list to view the list" text
        XCTAssertTrue(app.staticTexts["Click on To do list to view the list"].exists)
        
        // Check NavigationLink to TaskListView (label has "To Do List")
        XCTAssertTrue(app.buttons["To Do List"].exists)
        
        // Check navigation title
        XCTAssertTrue(app.navigationBars["Welcome to Swiftly 📝"].exists)
    }
    
    func testLocationButtonTriggersLocationRequest() throws {
        // Note: You can't easily test CoreLocation interaction in UI tests.
        // Instead, check if the button is hittable (interactable).
        
        let locationButton = app.buttons["Share Current Location"]
        XCTAssertTrue(locationButton.exists)
        XCTAssertTrue(locationButton.isHittable)
        // Tap the location button to simulate user action
        locationButton.tap()
        // Further CoreLocation permission dialogs would be handled manually or via UI test permissions.
    }
    
    func testNavigationLinksWork() throws {
        // Tap "View Weather" button and verify navigation
        app.buttons["View Weather"].tap()
        
        // Since WeatherView is destination, you might check for its unique UI elements here.
        // For example, wait for a label in WeatherView (replace "Weather" with actual text in WeatherView)
        let weatherTitle = app.staticTexts["Weather"] // Adjust this as per your WeatherView UI
        XCTAssertTrue(weatherTitle.waitForExistence(timeout: 2))
        
        app.navigationBars.buttons.element(boundBy: 0).tap() // Go back
        
        // Tap "To Do List" button and verify navigation
        app.buttons["To Do List"].tap()
        
        // Check for unique UI element in TaskListView
        let taskListTitle = app.staticTexts["Tasks"] // Adjust this as per your TaskListView UI
        XCTAssertTrue(taskListTitle.waitForExistence(timeout: 2))
    }
}
