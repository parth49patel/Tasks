//
//  ContentView.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

struct TasksList: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    @State var addTaskView: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(taskListViewModel.tasks) { task in
                    TaskRowView(task: task)
                        .padding(-10)
                        .onTapGesture {
                            withAnimation(.linear) {
                                taskListViewModel.updateTask(task: task)
                            }
                        }
                }
                .onDelete(perform: taskListViewModel.deleteTask(indexSet:))
                .onMove(perform: taskListViewModel.moveTask(from:to:))
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                        .font(.title3)
                        .bold()
                }
                ToolbarItem(placement: .bottomBar) {
                    AddNewTaskButton().offset(x: 90)
                }
            }
        }
    }
}

struct TasksList_Previews: PreviewProvider {
    static var previews: some View {
        TasksList()
            .environmentObject(TaskListViewModel())
    }
}
