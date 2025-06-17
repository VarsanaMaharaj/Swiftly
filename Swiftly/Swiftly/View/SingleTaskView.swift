//
//  SingleTaskView.swift
//  Swiftly
//
//  Created by Varsana Maharaj on 2025/06/14.
//

import SwiftUI
import SwiftData

struct SingleTaskView: View {
    let item: TaskModel
  //  @Bindable var item: TaskModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    .bold()
                Text(item.taskDescription)
                    .font(.subheadline)
                
                Text("\(item.timestamp.formatted(date: .numeric, time: .shortened))")
                    .font(.callout)
            }
            Spacer()
            
            Button(action: {
                item.isCompleted.toggle()
            } , label :{
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                    .font(.largeTitle)
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    NavigationView() {
        SingleTaskView(item: TaskModel())
            .modelContainer(for: TaskModel.self)
    }
}
