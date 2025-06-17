//
//  TaskModel.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/14.
//

import Foundation
import SwiftData

@Model
class TaskModel: ObservableObject {
    @Attribute(.unique) var id: String
    var title: String
    var taskDescription: String
    var timestamp: Date
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String = "", taskDescription: String = "" ,timestamp: Date = .now, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.taskDescription = taskDescription
        self.timestamp = timestamp
        self.isCompleted = isCompleted
    }
}
