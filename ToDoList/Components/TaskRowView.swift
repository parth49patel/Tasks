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
            Spacer()
            if colorScheme == .light {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundStyle(task.isCompleted ? Color.green : Color.black)
            } else {
                Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                        .foregroundStyle(task.isCompleted ? Color.green : Color.white)
            }
        }
        .fontDesign(.monospaced)
        .font(.system(size: 20))
        .fontWeight(task.isCompleted ? .regular : .semibold)
        .fontWeight(task.isCompleted ? .light : .semibold)
        .padding([.horizontal, .vertical], 3)
        
        .background((task.isCompleted && colorScheme == .light) ? LinearGradient(colors: [Color("completedTaskLight"), Color(.white)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color.clear], startPoint: .leading, endPoint: .trailing)
        )
        .background((task.isCompleted && colorScheme == .dark) ? LinearGradient(colors: [Color("completedTaskDark"), Color(.black)], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color.clear], startPoint: .leading, endPoint: .trailing)
        )
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var task1 = TaskListModel(task: "First Item", isCompleted: false)
    static var task2 = TaskListModel(task: "Second Item", isCompleted: false)
    
    static var previews: some View {
        Group {
            TaskRowView(task: task1)
            TaskRowView(task: task2)
        }
    }
}
