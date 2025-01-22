//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import Foundation
import SwiftData

@MainActor
class TaskListViewModel: ObservableObject {

    func addTask(title: String, modelContext: ModelContext) {
        let newTask = TaskListModel(task: title, isCompleted: false)
        modelContext.insert(newTask)
        do {
            try modelContext.save()
        } catch {
            print("Failed to save task: \(error)")
        }
    }
    
    func updateTask(task: TaskListModel, modelContext: ModelContext) {
        task.isCompleted.toggle()
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
    
    func deleteTask(indexSet: IndexSet, tasks: [TaskListModel], modelContext: ModelContext) {
        indexSet.forEach { index in
            let taskToDelete = tasks[index]
            modelContext.delete(taskToDelete)
        }
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
