//
//  ContentView.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI
import SwiftData

struct TasksList: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    @State var addTaskView: Bool = false
    @Query var tasks: [TaskListModel]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    TaskRowView(task: task)
                        .padding(-10)
                        .onTapGesture {
                            withAnimation(.linear) {
                                taskListViewModel.updateTask(task: task, modelContext: modelContext)
                            }
                        }
                }
                .onDelete { indexSet in
                    taskListViewModel.deleteTask(indexSet: indexSet, tasks: tasks, modelContext: modelContext)
                }
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
            .modelContainer(for: TaskListModel.self)
            .environmentObject(TaskListViewModel())
    }
}
