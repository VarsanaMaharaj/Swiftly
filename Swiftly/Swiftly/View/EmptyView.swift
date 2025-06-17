//
//  EmptyView.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/16.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("There are no tasks!")
                .font(.title)
                .fontWeight(.semibold)
            Text("Click the add button to add tasks to your todo list")
            NavigationLink(destination: AddTaskView(), label: {
                Text("Add Task")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                    .navigationBarBackButtonHidden(true)
            })
            .navigationTitle("Add a Task")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NavigationView() {
        EmptyView()
    }
}
