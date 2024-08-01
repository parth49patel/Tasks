//
//  ContentView.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

struct TasksList: View {
    
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    @State var addTaskView: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(taskListViewModel.tasks) { task in
                    TaskRowView(task: task)
                        .onTapGesture {
                            withAnimation(.linear) {
                                taskListViewModel.updateTask(task: task)
                            }
                        }
                }
                .onDelete(perform: deleteTask)
                .onMove(perform: moveTask)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Task List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        addTaskView.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .fontWeight(.bold)
                    }
                    .sheet(isPresented: $addTaskView) {
                        AddTask()
                    }
                }
            }
        }
    }
}

struct TasksList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TasksList()
        }
        .environmentObject(TaskListViewModel())
    }
}

extension TasksList {
    func deleteTask(indexSet: IndexSet) {
        taskListViewModel.tasks.remove(atOffsets: indexSet)
    }
    func moveTask(from: IndexSet, to: Int) {
        taskListViewModel.tasks.move(fromOffsets: from, toOffset: to)
    }
}
