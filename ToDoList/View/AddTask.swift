//
//  AddTask.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI
import SwiftData

struct AddTask: View {
    
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    @Environment(\.dismiss) var dismiss
    @State var task: String = ""
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TaskListModel.order, order: .forward) var tasks: [TaskListModel]
    
    var body: some View {
            VStack {
                VStack{
                    TextField("Enter task..", text: $task)
                        .padding()
                        .font(.system(size: 20, design: .monospaced))
                        .foregroundStyle(.primary)
                        .background(
                            Rectangle()
                                .stroke()
                                .foregroundColor(.primary)
                        )
                    Button {
                        saveTaskPressed()
                    } label: {
                        ButtonView(buttonName: "Save", icon: "square.and.arrow.down.fill", backgroundColor: .blue.opacity(0.8), textColor: .white)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
    }
    func saveTaskPressed() {
        taskListViewModel.addTask(title: task, tasks: tasks, modelContext: modelContext)
        dismiss()
    }
}

#Preview {
    AddTask()
        .modelContainer(for: TaskListModel.self)
}

