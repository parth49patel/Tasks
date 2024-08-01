//
//  TaskRowView.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

struct TaskRowView: View {
    
    let task: TaskListModel
    
    var body: some View {
        HStack {
            Text(task.task)
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(task.isCompleted ? Color.green : Color.black)
        }
        .fontDesign(.monospaced)
        .fontWeight(task.isCompleted ? .light : .semibold)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var task1 = TaskListModel(task: "First Item", isCompleted: false)
    static var task2 = TaskListModel(task: "Second Item", isCompleted: true)
    
    static var previews: some View {
        Group {
            TaskRowView(task: task1)
            TaskRowView(task: task2)
        }
    }
}
