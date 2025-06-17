//
//  AddTaskView.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/14.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var newTask = TaskModel()
    @State var validationText: String = "Please enter a valid task"
    @State var showValidationText: Bool = false
    
    var body: some View {
        List {
            TextField("Enter a task", text: $newTask.title)
            TextField("Enter task description", text: $newTask.taskDescription)
            DatePicker("Select date", selection: $newTask.timestamp)
            Button("Add task") {
                if newTask.title.isEmpty {
                    showValidationText = true
                    Text(validationText)
                        .foregroundColor(.red)
                    return
                } else {
                    withAnimation {
                        modelContext.insert(newTask)
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Add a Task")
    }
}

#Preview {
    NavigationView() {
        AddTaskView()
            .modelContainer(for: TaskModel.self, inMemory: true)
    }
}
