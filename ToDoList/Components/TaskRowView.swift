//
//  TaskRowView.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

struct TaskRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let task: TaskListModel
    
    var body: some View {
        HStack {
            Text(task.task)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(
                    task.isCompleted ? Color.green : (colorScheme == .light ? Color.black : Color.white)
                )
        }
        .font(.system(size: 20, weight: task.isCompleted ? .light: .semibold, design: .monospaced))
        .padding([.horizontal, .vertical], 3)
        
        .background(
            task.isCompleted ? LinearGradient(
                colors: colorScheme == .light
                    ? [Color("completedTaskLight"), Color(.white)]
                    : [Color("completedTaskDark"), Color(.black)],
                startPoint: .leading,
                endPoint: .trailing)
            : LinearGradient(
                colors: [Color.clear],
                startPoint: .leading,
                endPoint: .trailing)
        )
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var task1 = TaskListModel(task: "First Item", isCompleted: false, order: 1)
    static var task2 = TaskListModel(task: "Second Item", isCompleted: false, order: 2)
    
    static var previews: some View {
        Group {
            TaskRowView(task: task1)
            TaskRowView(task: task2)
        }
    }
}
