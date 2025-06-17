//
//  TaskListView.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/14.
//

import Foundation
import SwiftUI
import SwiftData

struct TaskListView: View {
    @State private var showAddTaskView: Bool = false
    @State private var editToDo: TaskModel?

    @Query(
        filter: #Predicate { !$0.isCompleted },
        sort: \TaskModel.timestamp,
        order: .reverse
    ) private var todoTasks: [TaskModel]
    
    @Query(
        filter: #Predicate { $0.isCompleted },
        sort: \TaskModel.timestamp,
        order: .reverse
    ) private var completedTasks: [TaskModel]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            if todoTasks.isEmpty && completedTasks.isEmpty {
                EmptyView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    if !todoTasks.isEmpty {
                        Section(header: Text("To-Do")) {
                            ForEach(todoTasks) { item in
                                SingleTaskView(item: item)
                                    .swipeActions {
                                        Button {
                                            editToDo = item
                                        } label: {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.orange)
                                        
                                        Button("Delete", systemImage: "trash") {
                                            modelContext.delete(item)
                                        }
                                        .tint(.red)
                                    }
                            }
                        }
                    }
                    
                    if !completedTasks.isEmpty {
                        Section(header: Text("Completed")) {
                            ForEach(completedTasks) { item in
                                SingleTaskView(item: item)
                                    .swipeActions {
                                        Button("Undo", systemImage: "arrow.uturn.backward") {
                                            undoTaskCompletion(item)
                                        }
                                        .tint(.blue)
                                        
                                        Button("Delete", systemImage: "trash") {
                                            modelContext.delete(item)
                                        }
                                        .tint(.red)
                                    }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle(Text("Todo List 📝"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showAddTaskView.toggle()
                        }, label: {
                            Label("Add Task", systemImage: "plus.circle.fill")
                        })
                    }
                }
                .sheet(isPresented: $showAddTaskView, content: {
                    NavigationStack {
                        AddTaskView()
                    }
                    .presentationDetents([.medium])
                })
                .sheet(item: $editToDo) {
                    editToDo = nil
                } content: { item in
                    UpdateToDoView(item: item)
                }
            }
        }
    }
    
    // MARK: - Helper Methods
    private func markTaskAsCompleted(_ task: TaskModel) {
        task.isCompleted = true
        try? modelContext.save()
    }
    
    private func undoTaskCompletion(_ task: TaskModel) {
        task.isCompleted = false
        try? modelContext.save()
    }
}

#Preview {
    NavigationView() {
        TaskListView()
            .modelContainer(for: TaskModel.self)
    }
}
