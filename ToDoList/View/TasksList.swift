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
    @Query(sort: \TaskListModel.order, order: .forward) var tasks: [TaskListModel]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        ZStack {
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
                    .onMove { indexSet, newOffset in
                        withAnimation(.smooth) {
                            taskListViewModel.moveTasks(indices: indexSet, newOffset: newOffset, tasks: tasks, modelContext: modelContext)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Tasks")
                .sheet(isPresented: $addTaskView) {
                    AddTask()
                        .presentationDetents([.fraction(0.25)])
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                            .font(.title3)
                            .bold()
                    }
                }
            }
            ButtonView(buttonName: "Add Task", icon: "plus.circle", backgroundColor: .gray.opacity(0.4), textColor: colorScheme == .light ? .black : .white)
                .offset(x: 100, y: 360)
                .onTapGesture {
                    addTaskView = true
                }
        }
    }
}
#Preview {
    TasksList()
        .modelContainer(for: TaskListModel.self)
}
