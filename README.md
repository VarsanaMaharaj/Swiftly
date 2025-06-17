# Swiftly - Task Management App
Get Things Done, Come Rain or Sun!

## Overview

Swiftly is a task management application designed to help users stay organized while providing relevant weather information.

## Features

### Task Management
- **Create Tasks**: Add tasks with a title, description, and a visual indicator for completion status.
- **Edit Tasks**: Update task details by tapping on an existing task.
- **Mark Tasks as Completed**: Use a tick circle to indicate completion and move tasks to a "Completed" section.
- **Delete Tasks**: Swipe left to delete tasks or use a dedicated recycle bin feature.
- **Two-Section View**: Separate tasks into "Todo" and "Completed" categories for better organization.
- **Local Data Persistence**: Save and persist all tasks locally to ensure offline access.

### Weather Information
- **Weather Details**: Display the current temperature, sunrise, and sunset times for the user's location.
- **Location-Based Data**: Fetch weather information dynamically using the device's location.
- **Networking Layer**: A robust and reusable networking layer to handle API calls for weather data.

### User Interface and Accessibility
- **Light and Dark Mode**: Support for system-wide theme settings.
- **Dynamic Text Sizing**: Native support for adjustable text sizes to enhance accessibility.
- **Error Handling**: Comprehensive validation and error handling for a smooth user experience.

## Tech Stack:
- SwiftData: Data storage and persistence
- SwiftUI + MVVM architecture
- Frameworks: CoreLocation, Combine, SwiftUI, XCTest
- JSON Decoding & OpenWeatherMap API

## Installation

### Prerequisites
- Xcode 14.0+ and macOS 12.0+.
- Internet access to fetch weather data.
- A free [[(https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key})]] account for an API key.

Hope you enjoy the app! Contact the developer for any questions!
