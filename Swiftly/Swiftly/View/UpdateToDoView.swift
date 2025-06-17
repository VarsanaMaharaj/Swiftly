//
//  CompletedListView.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/17.
//

import SwiftUI
import SwiftData

struct UpdateToDoView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Bindable var item: TaskModel
    
    var body: some View {
        List {
            TextField("Enter a task", text: $item.title)
            TextField("Enter task description", text: $item.taskDescription)
            DatePicker("Select date", selection: $item.timestamp)
            Button("Edit task") {
                withAnimation {
                    modelContext.insert(item)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    dismiss()
                }
            }
        }
        .navigationTitle("Edit task")
    }
}

#Preview {
    TaskListView()
}
