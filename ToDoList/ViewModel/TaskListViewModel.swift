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

    func addTask(title: String, tasks: [TaskListModel], modelContext: ModelContext) {
        let nextOrder = (tasks.max(by: { $0.order < $1.order })?.order ?? 0) + 1
        let newTask = TaskListModel(task: title, isCompleted: false, order: nextOrder)
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
    
    func moveTasks(indices: IndexSet, newOffset: Int, tasks: [TaskListModel], modelContext: ModelContext) {
        var reorderedTasks = tasks
        reorderedTasks.move(fromOffsets: indices, toOffset: newOffset)
        for (index, task) in reorderedTasks.enumerated() {
            task.order = index
        }
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
